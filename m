From: thierry.reding@gmail.com (Thierry Reding)
Date: Thu, 6 Jul 2017 08:59:10 +0200
Subject: [PATCH v2 0/3] pwm: add pwm AO on meson gx
In-Reply-To: <20170608122416.1993-1-jbrunet@baylibre.com>
References: <20170608122416.1993-1-jbrunet@baylibre.com>
Message-ID: <20170706065910.GJ16144@ulmo.fritz.box>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Thu, Jun 08, 2017 at 02:24:13PM +0200, Jerome Brunet wrote:
> The pwms found in the AO domain of the meson gx family have different
> clock sources than the ones found in the EE domain. The AO pwms only
> have 2 connected clock input which are clk81 and the crytal.
> 
> This patchset adds the necessary compatible and the clock data for it.
> 
> Changes since v1: [0]
> * Correct clock source order for gxbb pwm ao. Documenation shows xtal as
>   source #1 while it is actually source #0
> * Add patch 3 to fix pwm calculation. Issue while testing pwm with clk81
>   as clock source.
> 
> [0]:  https://lkml.kernel.org/r/20170607133013.4766-1-jbrunet at baylibre.com
> 
> Jerome Brunet (3):
>   dt-bindings: pwm: meson: add comptabible for gxbb ao pwms
>   pwm: meson: add compatible for the gxbb ao pwms
>   pwm: meson: improve pwm calculation precision.
> 
>  .../devicetree/bindings/pwm/pwm-meson.txt          |  4 +-
>  drivers/pwm/pwm-meson.c                            | 47 +++++++++++++++++-----
>  2 files changed, 41 insertions(+), 10 deletions(-)

For some reason the Author field keeps getting set to:

	jbrunet <jbrunet@baylibre.com>

It seems like the headers are correct, so maybe this is patchwork
messing things up?

Anyway, I've applied the series and manually fixed up the Author field.

Thanks,
Thierry
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20170706/a774625d/attachment.sig>
