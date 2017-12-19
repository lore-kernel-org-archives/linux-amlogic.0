From: narmstrong@baylibre.com (Neil Armstrong)
Date: Tue, 19 Dec 2017 11:28:13 +0100
Subject: Faults on Odroid-C2 during shutdown and fix proposal
In-Reply-To: <c28e0ecf-9bf3-f6e8-b8c8-91b14bf797f6@gmail.com>
References: <c28e0ecf-9bf3-f6e8-b8c8-91b14bf797f6@gmail.com>
Message-ID: <ca5d79dd-5a6a-e580-1cd7-6bbe698fd6b3@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 16/12/2017 00:19, Heiner Kallweit wrote:
> Neil,
> 
> during shutdown I experience faults as described in the commit message of
> 339cd0ea0822 "soc: amlogic: meson-gx-pwrc-vpu: fix power-off when powered by bootloader"
> 
> My best guess:
> I operate the board headless, therefore the domain is never powered on, leaving the
> clocks disabled. The shutdown function then tries to disable the already disabled
> clocks.
> The following change fixes it for me, however there may be scenarios I miss,
> therefore I'd like to hear your opinion.
> 
>  static void meson_gx_pwrc_vpu_shutdown(struct platform_device *pdev)
>  {
> -       meson_gx_pwrc_vpu_power_off(&vpu_hdmi_pd.genpd);
> +       bool powered_off;
> +
> +       powered_off = meson_gx_pwrc_vpu_get_power(&vpu_hdmi_pd);
> +       if (!powered_off)
> +               meson_gx_pwrc_vpu_power_off(&vpu_hdmi_pd.genpd);
>  }
> 
> And something completely different:
> I get a misleading error message "failed to get reset lines", caused by the fact
> that devm_reset_control_array_get() returns -EPROBE_DEFER. So I think we should
> print the error message only if the error is not caused by a probe deferral.

Feel free to provide a patch.

> 
> Kind regards,
> Heiner
> 

Hi Heiner,

Indeed, it's another corner case, please provide a patch.

Thanks,
Neil
