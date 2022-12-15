#!/bin/bash

# CPU & RAM monitor

# v1
# cpu=`bash -c $'top -n 1 | head -n 3 | tail -n 1 | awk \'{print $2 + $4}\''`
# echo HELLO $cpu

# v2
# https://askubuntu.com/questions/941949/one-liner-to-show-cpu-ram-and-hdd-usage
# echo "CPU `LC_ALL=C top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}'`% RAM `free -m | awk '/Mem:/ { printf("%3.1f%%", $3/$2*100) }'` HDD `df -h / | awk '/\// {print $(NF-1)}'`"

# v3
now=`date '+%Y-%m-%d %H:%M:%S'`
echo "$now;`LC_ALL=C top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}'`;`free -m | awk '/Mem:/ { printf("%.0f", $3/$2*100) }'`"


import java.text.MessageFormat;
import java.util.prefs.BackingStoreException;
import java.util.prefs.Preferences;

public final class Main {
    private static final String[] node = new String[]{"-node", "-nod", "-no", "-n"};
    private static final String[] user = new String[]{"-user", "-use", "-us", "-u"};
    private static final String[] system = new String[]{"-system", "-syste", "-syst", "-sys", "-sy", "-s"};
    private static final String[] key = new String[]{"-key", "-ke", "-k"};
    private static final String[] value = new String[]{"-value", "-valu", "-val", "-va", "-v"};
    private static final String[] help = new String[]{"-help", "-hel", "-he", "-h", "?"};
    private static final String ent = "\n";
    private static final String STR_HELP;
    private static final String USER_HELP;
    private static final String SYS_HELP;
    private static final String HELP;

    private Main() {
    }

    public static void main(String[] var0) throws BackingStoreException {
        if (var0.length != 0 && getFunc(user, var0)) {
            setPref(var0, true);
        } else if (var0.length != 0 && getFunc(system, var0)) {
            setPref(var0, false);
        } else {
            System.out.println(HELP);
        }

    }

    private static void setPref(String[] var0, boolean var1) throws BackingStoreException {
        if (getFunc(help, var0)) {
            if (var1) {
                System.out.println(USER_HELP);
            } else {
                System.out.println(SYS_HELP);
            }
        } else {
            String var2 = getValue(node, var0, (String)null);
            String var3 = getValue(key, var0, (String)null);
            String var4 = getValue(value, var0, (String)null);
            if (var2 != null && var3 != null && var4 != null) {
                Preferences var5;
                if (var1) {
                    var5 = Preferences.userRoot().node(var2);
                } else {
                    var5 = Preferences.systemRoot().node(var2);
                }

                String var6 = var5.get(var3, (String)null);
                if (var6 == null || !var6.equals(var4)) {
                    var5.put(var3, var4);
                    var5.flush();
                }
            }
        }

    }

    public static String getValue(String[] var0, String[] var1, String var2) {
        String var3 = null;

        for(int var4 = 0; var4 < var1.length; ++var4) {
            for(int var5 = 0; var5 < var0.length; ++var5) {
                if (var1[var4].equalsIgnoreCase(var0[var5]) && !"-".equals(var1[var4 + 1].substring(0, 1))) {
                    var3 = var1[var4 + 1];
                    break;
                }
            }
        }

        if (var3 == null) {
            var3 = var2;
        }

        return var3;
    }

    public static boolean getFunc(String[] var0, String[] var1) {
        for(int var2 = 0; var2 < var1.length; ++var2) {
            for(int var3 = 0; var3 < var0.length; ++var3) {
                if (var1[var2].equalsIgnoreCase(var0[var3])) {
                    return true;
                }
            }
        }

        return false;
    }

    static {
        STR_HELP = "setPref {0} preferences: \n" + node[0] + " node " + key[0] + " key " + value[0] + " value {1}";
        USER_HELP = (new MessageFormat(STR_HELP)).format(new String[]{"user", user[0]});
        SYS_HELP = (new MessageFormat(STR_HELP)).format(new String[]{"system", system[0]});
        HELP = "HELP\n" + SYS_HELP + "\n" + USER_HELP;
    }
}
