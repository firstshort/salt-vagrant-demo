#!py 
import yaml
def run(): 

    rrole_definitions = {
        'haproxy': [
            'minion2',
            'node1',
        ],
        'webserver': [
            'minion1',
            'node2',
            'node4',
            'node5',
        ],
        'database': [
            'node3',
            'minion2',
            'node4',
        ],
        'caching': [
            'node5',
        ],
    }
    role_definitions = __pillar__.items()
#    role_definitions = __pillar__['role_defs']
#    stream = open("/srv/pillar/role_definitions.sls", "r")
    stream = file('/srv/pillar/role_definitions.sls', 'r')
    rrrole_definitions = yaml.load(stream)
#    2role_definitions = __pillar__['role_defs']
    with open('/tmp/foo.txt', 'a') as f:
      f.write('yamlloadstream = %s\n' % rrrole_definitions)
      f.write('pillar_role = %s\n' % role_definitions)

#    roles = [k for k, v in role_definitions.iteritems() 
    roles = [k for k, v in role_definitions['role_defs'].iteritems() 
        if __opts__['id'] in v] 

    return { 
        'roles': roles, 
    } 
