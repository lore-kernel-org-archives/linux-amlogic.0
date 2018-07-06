From: sboyd@kernel.org (Stephen Boyd)
Date: Fri, 06 Jul 2018 10:58:25 -0700
Subject: [GIT PULL] Amlogic clock fixes for v4.18-rc
In-Reply-To: <1530604912.2900.152.camel@baylibre.com>
References: <1530604912.2900.152.camel@baylibre.com>
Message-ID: <153089990511.143105.13825086493199733880@swboyd.mtv.corp.google.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Quoting Jerome Brunet (2018-07-03 01:01:52)
> Dear clock maintainers,
> 
> Below is a request to pull amlogic clock fixes for v4.18.
> 
> These are two simple fixes, yet the first one is quite important as it solves
> boots hangs we've been having when FDIV2 gets disabled. This did not show up
> before because this particular clock is heavily used and only gets disabled for
> a very short period of time before modules (such as ethernet or emmc) probe.
> 

Thanks. Pulled into clk-fixes.
