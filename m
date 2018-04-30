From: thierry.reding@gmail.com (Thierry Reding)
Date: Mon, 30 Apr 2018 10:34:47 +0200
Subject: [PATCH] pwm: meson: fix allocation of meson_pwm_channel array
In-Reply-To: <20180428212521.29328-1-martin.blumenstingl@googlemail.com>
References: <20180428212521.29328-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180430083447.GJ2484@ulmo>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sat, Apr 28, 2018 at 11:25:21PM +0200, Martin Blumenstingl wrote:
> Using the pwm-meson driver on the 32-bit SoCs causes memory corruption.
> The result are some hard-to-explain errors, for example
> devm_clk_register crashes with a NULL dereference somewhere deep in the
> common clock framework code.
> In some cases the kernel even refused to boot when any of the PWM
> controllers were enables on Meson8b.
> 
> The root cause seems to be an incorrect memory size in the devm_kcalloc
> call in meson_pwm_probe. The code allocates an array of meson_pwm_channel
> structs, but the size given is the size of the meson_pwm struct (which
> seems like a small copy-and-paste error, as meson_pwm is allocated a few
> lines above).
> Even with this typo the code seemed to work fine on the 64-bit GX SoCs
> (maybe due to the structs having the same size in the compiled result,
> but I haven't checked this further).
> 
> Fixes: 211ed630753d2f ("pwm: Add support for Meson PWM Controller")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/pwm/pwm-meson.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thierry
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20180430/cdaf4204/attachment.sig>
