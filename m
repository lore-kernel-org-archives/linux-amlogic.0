From: linus.luessing@c0d3.blue (Linus =?utf-8?Q?L=C3=BCssing?=)
Date: Fri, 29 Sep 2017 13:01:27 +0200
Subject: [RFC PATCH] ARM: dts: meson8b: add reserved memory zones
In-Reply-To: <20170929104132.18138-1-linus.luessing@c0d3.blue>
References: <20170929104132.18138-1-linus.luessing@c0d3.blue>
Message-ID: <20170929110127.GL6726@otheros>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Fri, Sep 29, 2017 at 12:41:32PM +0200, Linus L?ssing wrote:
> The following stress-ng command worked fine now:
> $ stress-ng -v --sequential 0 -t 120s --exclude sysfs,opcode --metrics
> (5 hours runtime, tested on an Odroid C1+ with an 4.14-rc1 kernel + SMP
> + USB DTS patches)

Full log file (6.3MB) here:
http://metameute.de/~tux/linux/amlogic/stress-ng-odroidc1%2b-with-resmem%2bsmp-log.txt
