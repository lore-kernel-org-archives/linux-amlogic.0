From: sboyd@kernel.org (Stephen Boyd)
Date: Mon, 01 Oct 2018 10:55:45 -0700
Subject: [GIT PULL] clk: meson: updates for v4.20
In-Reply-To: <ee3c1d81101e3e42218c696f663fb8716dfd53a7.camel@baylibre.com>
References: <ee3c1d81101e3e42218c696f663fb8716dfd53a7.camel@baylibre.com>
Message-ID: <153841654593.119890.11490720497943121631@swboyd.mtv.corp.google.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Quoting Jerome Brunet (2018-09-27 07:45:02)
> Dear clock maintainers,
> 
> Below is a request to pull updates for Amlogic clocks.
> There is not much out of the ordinary there, except:
> - Even if we don't like it, the entire meson8b is now using
>   CLK_OF_DECLARE_DRIVER(). Previously, only the reset controller
>   part used this but it seems there is no way around it (yet) to
>   handle certain things on this SoC, such as the TWD timer.
> - We are a bit late compared to the usual schedule, sorry about that.

No worries. I'm also late this time.

Pulled into clk-next. Thanks.
