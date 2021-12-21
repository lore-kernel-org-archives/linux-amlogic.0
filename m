Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEDD6C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Dec 2021 13:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TrDNzf++Bt82dbwLNM1mVyEiYLEm1vhHgW1kxbahvs0=; b=Mr+9dVKfSstZVe
	pVTVyxa9yIFz7A2EL2vY3vICUTHzI7/ZY7/w260IIUcQcO+F3tczahm63o7dpmx1g0cIRZoLE1zVj
	H84whfKUKXFjhOndwaKhaVcU5/HzBI8zDTJnjMnvgjnkHahoOhs36KfhiE8bzkwtxown8nz7sInTI
	UFLu96DX/DQ5gUXuYrbdP9Tee61e5nmSVkBlLdMlfjlgH4yoLqwNbl0whZjLRzRirqeIatN4aN7EF
	R2vicjOFJ2xHhxr9qS+zJLuy0OdGdO7bDlrDJ1QLP1Zn9jGWac4q1JGJUM/3kGEgdHDl1T6xjBJDo
	7VMzSDc5wEstvWCldFAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzeno-006qbb-N0; Tue, 21 Dec 2021 13:03:36 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzenY-006qTe-Fx
 for linux-amlogic@lists.infradead.org; Tue, 21 Dec 2021 13:03:23 +0000
Received: by mail-lf1-x132.google.com with SMTP id g11so29260061lfu.2
 for <linux-amlogic@lists.infradead.org>; Tue, 21 Dec 2021 05:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TWzCt+T8UkYpAGzTveuD56wBYeSm7wcDkmh117uxRvU=;
 b=K3V/VNH6ZIoPn4j0ryz6Cm6UZFFfVitYHO+kQBB0J90Qp/9ITQ/TGs35UiB5nASven
 3YKV8ZgUfLLaZhYB5P0/90FpvVP7kgpIW9v7IDxyN2x8cD/1EiIrIzekM5Dxt1o6NUjB
 FpdIHBCd90heM4yxUhI3c88o+75KD2KUVDcCjOZ0VBGYCGr9tiYs98fDuMqM28rAXF2n
 b4pSidVT43tR/6lVe0/KubUBTu+NmnTi6CIrwZ0nN8onY//z2eeLliiR87CGlaRll8Gb
 6Ce3u/FRuKC/dgfcegt03/hGrkqtWEXVyuo5cKQOa8L2nmYKOq4rLTn69I73NfJYaqqH
 YGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TWzCt+T8UkYpAGzTveuD56wBYeSm7wcDkmh117uxRvU=;
 b=Lg5kODQKvpaPuuFnrvCPAj+tR3GP3GqDd0HJkoAvMYeZne2SMkFG07kieYLL42mvXm
 koAaLJjh21flWm89tzbU0FqzQftPuPsZpS4OiZkB7JZPI9BqXpyA+nSdf+VXhajsgLHM
 eIKyhvZiF3kJAww124s+sGxiQoebyTlItq61LDC1XBHXaKxTTgDK814vwmCtjOvnMJB3
 J71PTmfmG1EYUKQJAYrae5TmhlwTZPGGXJDD+FoZQtg1qv21mdsjTOTecQGHHUI8Syvi
 GrxkMuvS9stwJiJwNyy920BbOlSA/VWGTW+VqcrsQcnJF4L2N3rJPUdhk8HKMc+tg+p8
 ANvQ==
X-Gm-Message-State: AOAM530rjtL5cZytqgdmc/ZR7E5jQa6EQfXWSz+COdXp2y2yDDDofCcj
 hgGNOFk2d1TdgGVOhb2tS2OPWc0Ku/wmSV+T3Ah47w==
X-Google-Smtp-Source: ABdhPJzlKqWv6wXLhW5FNFjEcxu5IsCLseG7Ejt3W39SV2RDB50NrFUNXphXzmj6T+y5IRvHkg6RUg1AoGyNFwSVSdA=
X-Received: by 2002:a19:5019:: with SMTP id e25mr2971601lfb.254.1640091797600; 
 Tue, 21 Dec 2021 05:03:17 -0800 (PST)
MIME-Version: 1.0
References: <20211219153442.463863-1-martin.blumenstingl@googlemail.com>
 <20211219153442.463863-2-martin.blumenstingl@googlemail.com>
In-Reply-To: <20211219153442.463863-2-martin.blumenstingl@googlemail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 21 Dec 2021 14:02:39 +0100
Message-ID: <CAPDyKFry2L5RKTtxKQ-Qu+xJEsK-hSCNgrgB371MMSGsd4DwZA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mmc: meson-mx-sdhc: Set MANUAL_STOP for
 multi-block SDIO commands
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mmc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_050320_552713_9DAF2290 
X-CRM114-Status: GOOD (  25.57  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, 19 Dec 2021 at 16:34, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> The vendor driver implements special handling for multi-block
> SD_IO_RW_EXTENDED (and SD_IO_RW_DIRECT) commands which have data
> attached to them. It sets the MANUAL_STOP bit in the MESON_SDHC_MISC
> register for these commands. In all other cases this bit is cleared.
> Here we omit SD_IO_RW_DIRECT since that command never has any data
> attached to it.
>
> This fixes SDIO wifi using the brcmfmac driver which reported the
> following error without this change on a Netxeon S82 board using a
> Meson8 (S802) SoC:
>   brcmf_fw_alloc_request: using brcm/brcmfmac43362-sdio for chip
>                           BCM43362/1
>   brcmf_sdiod_ramrw: membytes transfer failed
>   brcmf_sdio_download_code_file: error -110 on writing 219557 membytes
>                                  at 0x00000000
>   brcmf_sdio_download_firmware: dongle image file download failed
>
> And with this change:
>   brcmf_fw_alloc_request: using brcm/brcmfmac43362-sdio for chip
>                           BCM43362/1
>   brcmf_c_process_clm_blob: no clm_blob available (err=-2), device may
>                             have limited channels available
>   brcmf_c_preinit_dcmds: Firmware: BCM43362/1 wl0: Apr 22 2013 14:50:00
>                          version 5.90.195.89.6 FWID 01-b30a427d
>
> Fixes: e4bf1b0970ef96 ("mmc: host: meson-mx-sdhc: new driver for the Amlogic Meson SDHC host")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe



> ---
>  drivers/mmc/host/meson-mx-sdhc-mmc.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/drivers/mmc/host/meson-mx-sdhc-mmc.c b/drivers/mmc/host/meson-mx-sdhc-mmc.c
> index 7cd9c0ec2fcf..8fdd0bbbfa21 100644
> --- a/drivers/mmc/host/meson-mx-sdhc-mmc.c
> +++ b/drivers/mmc/host/meson-mx-sdhc-mmc.c
> @@ -135,6 +135,7 @@ static void meson_mx_sdhc_start_cmd(struct mmc_host *mmc,
>                                     struct mmc_command *cmd)
>  {
>         struct meson_mx_sdhc_host *host = mmc_priv(mmc);
> +       bool manual_stop = false;
>         u32 ictl, send;
>         int pack_len;
>
> @@ -172,12 +173,27 @@ static void meson_mx_sdhc_start_cmd(struct mmc_host *mmc,
>                 else
>                         /* software flush: */
>                         ictl |= MESON_SDHC_ICTL_DATA_XFER_OK;
> +
> +               /*
> +                * Mimic the logic from the vendor driver where (only)
> +                * SD_IO_RW_EXTENDED commands with more than one block set the
> +                * MESON_SDHC_MISC_MANUAL_STOP bit. This fixes the firmware
> +                * download in the brcmfmac driver for a BCM43362/1 card.
> +                * Without this sdio_memcpy_toio() (with a size of 219557
> +                * bytes) times out if MESON_SDHC_MISC_MANUAL_STOP is not set.
> +                */
> +               manual_stop = cmd->data->blocks > 1 &&
> +                             cmd->opcode == SD_IO_RW_EXTENDED;
>         } else {
>                 pack_len = 0;
>
>                 ictl |= MESON_SDHC_ICTL_RESP_OK;
>         }
>
> +       regmap_update_bits(host->regmap, MESON_SDHC_MISC,
> +                          MESON_SDHC_MISC_MANUAL_STOP,
> +                          manual_stop ? MESON_SDHC_MISC_MANUAL_STOP : 0);
> +
>         if (cmd->opcode == MMC_STOP_TRANSMISSION)
>                 send |= MESON_SDHC_SEND_DATA_STOP;
>
> --
> 2.34.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
