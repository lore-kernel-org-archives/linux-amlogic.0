From: sboyd@kernel.org (Stephen Boyd)
Date: Mon, 09 Jul 2018 09:54:41 -0700
Subject: [GIT PULL]  clk: meson: updates for v4.19
In-Reply-To: <1531140923.2708.19.camel@baylibre.com>
References: <1531140923.2708.19.camel@baylibre.com>
Message-ID: <153115528186.143105.10978033720652183122@swboyd.mtv.corp.google.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Quoting Jerome Brunet (2018-07-09 05:55:23)
> Dear clock maintainers,
> 
> Below is a request to pull a first round of Amlogic  clock updates for
> v4.19. It is based on our previous fixes PR (meson-clk-fixes-4.18-1) to
> avoid conflicts while removing the audio divider driver.
> 
> Also, we had to pull your 'clk-core-duty-cycle' branch because the audio
> sclk divider driver implements duty cycle operation. This explains the
> changes reported in CCF core files in the summary below. 
> 

Thanks. Pulled into clk-next.
