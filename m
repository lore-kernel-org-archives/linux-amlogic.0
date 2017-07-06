From: thierry.reding@gmail.com (Thierry Reding)
Date: Thu, 6 Jul 2017 23:21:57 +0200
Subject: [PATCH v2 3/3] pwm: meson: improve pwm calculation precision.
In-Reply-To: <20170608122416.1993-4-jbrunet@baylibre.com>
References: <20170608122416.1993-1-jbrunet@baylibre.com>
 <20170608122416.1993-4-jbrunet@baylibre.com>
Message-ID: <20170706212154.GA28918@mithrandir>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Thu, Jun 08, 2017 at 02:24:16PM +0200, Jerome Brunet wrote:
> When using input clocks with high rates, such as clk81 (166MHz), the
> fin_ns = NSEC_PER_SEC / fin_freq can introduce a significant error.
> 
> Ex: fin_freq = 166666667, NSEC_PER_SEC = 1000000000
>     fin_ns = 5,9999999
> 
> which is, of course, rounded down to 5. This introduce an error of ~20%
> on the period requested from the pwm.
> 
> This patch use ps instead of ns (and 64bits integer) to perform the
> calculation. This should give a good enough precision.
> 
> Fixes: 211ed630753d ("pwm: Add support for Meson PWM Controller")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/pwm/pwm-meson.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index b911a944744a..4cdc66f7f718 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -163,7 +163,8 @@ static int meson_pwm_calc(struct meson_pwm *meson,
>  			  unsigned int duty, unsigned int period)
>  {
>  	unsigned int pre_div, cnt, duty_cnt;
> -	unsigned long fin_freq = -1, fin_ns;
> +	unsigned long fin_freq = -1;
> +	u64 fin_ps;
>  
>  	if (~(meson->inverter_mask >> id) & 0x1)
>  		duty = period - duty;
> @@ -179,13 +180,14 @@ static int meson_pwm_calc(struct meson_pwm *meson,
>  	}
>  
>  	dev_dbg(meson->chip.dev, "fin_freq: %lu Hz\n", fin_freq);
> -	fin_ns = NSEC_PER_SEC / fin_freq;
> +	fin_ps = ((u64)NSEC_PER_SEC * 1000) / fin_freq;

This failed to build, so I had to change this division to a do_div().

Thierry
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20170706/ec75893f/attachment.sig>
