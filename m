Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CC0C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Dec 2021 13:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ihKa3jqV0i7Y1KZr3nN9eg/+RKAhW+NPX/X+nKoN6CY=; b=hbaT2ZBQiUrEwX
	hFYrFvgE3gjjq12wcSqkT9uBJKiyV6OR0eQcxJwRa9jICcQwf1eH0kAK0Jl8U37Ye8NVZNdd2PAGW
	p9F3c4i9RPL4TKmRBPZONaWqWBPeDhuFRm2ldj8+E+afuPoPCAbR0UjUqZVImTZV4NZm3lJRjzdgX
	3ooz1EFXSOD4WgvRtxpRLZQT1mz9dgT+b1m50imp39ZCC4Es3JLNDZcwPaEgjfxOL760Puf6uFVr8
	BEDaRkv8WSJztIkjD9ovvdjzGL/BpoDaabwsPpC/izCysMDMkrv3hmlJIrfMIrm4CSqxAotcaPFhf
	h5GfI4ztgWw4uQE9W75g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx7kE-00E8i1-W5; Tue, 14 Dec 2021 13:21:27 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx7k2-00E8f3-5h
 for linux-amlogic@lists.infradead.org; Tue, 14 Dec 2021 13:21:16 +0000
Received: by mail-lj1-x231.google.com with SMTP id v15so28345763ljc.0
 for <linux-amlogic@lists.infradead.org>; Tue, 14 Dec 2021 05:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M9Wl5lITTts8KnryH+o6/rjfKY83qkpib99rnG6MLKU=;
 b=bwceb9iKmYVq/D+jBiFE3KXrNwiPRMQzWXwF3DPLI2Cps7rZlOfLcgmBc+W+42pqkF
 8Bf6F7ojcsAQ4nKKUw0zriAvgNrs2vVt1YTo8F9JbC2qidPIhYCXlT2h2pC2gqsm6yrg
 MV2FCr4hBidsRw+8dCkw85U7vYvO+m0apaiudFlcMGTdlSKo/jeHtQg1pqsRi3dhbEHa
 5YGo+ceVI+zoFCTyYfMlDElus2IpanFsbK5g289TcdphgVtkXIXtiWoa7aKY8vMCzUFV
 y/l7L2IcUNTHlht25MaL0TEWFlDXoG+IzAHhqHIfgQ9GPvhM6m7X7YDhvEynOQZfCaxT
 FXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M9Wl5lITTts8KnryH+o6/rjfKY83qkpib99rnG6MLKU=;
 b=ejdDPvqwTCYn8weFyR+FVZBGEYyMqoFs6bWcOGXMFsQ3+1r3FnnWRwVcH0Itb6cd1z
 qkKw9i5hDfzCx/RvDBDV6TrE8lECTq2vop/VL00LA2hcNxvjbmUIe0SiSlo6m3UMRrSU
 +e3BGmqGWbcesrVwC1yEq1PSnhCZd8rLWHISV8ZRQwA7jT+LuqYp7jCqqQJd/O1v5Ny8
 4GCaWLaNPQBPMJrvxAIrAUrK71If7l0oukTmkut/rquFrfc7cjCyhyxbwH0fr0bd0jhy
 5F4Z0/rt3+l9FQovGeydDgkUVZq2OkskmN+hxmb4S6EfisZWNy9CLrRq9avEFH2vHq0n
 BQ1g==
X-Gm-Message-State: AOAM5332t9W0LAIqrPuKGnxz1Ga86+g6it3saT4qKT5vpBtNk92M2wIp
 BVkUznGpQxX9drcJe5HjQUS0HOeGN5i/K8/KHdah9A==
X-Google-Smtp-Source: ABdhPJwhGEndahGW68SqTRlSvysT3YExx60q46MfQeoplF9RHvnSnojc8WHIF0sOtUQk2EbReAF7vuu+x2t31V3fF80=
X-Received: by 2002:a2e:a22a:: with SMTP id i10mr5018537ljm.16.1639488070994; 
 Tue, 14 Dec 2021 05:21:10 -0800 (PST)
MIME-Version: 1.0
References: <20211212145956.1423755-1-martin.blumenstingl@googlemail.com>
 <20211212145956.1423755-2-martin.blumenstingl@googlemail.com>
In-Reply-To: <20211212145956.1423755-2-martin.blumenstingl@googlemail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 14 Dec 2021 14:20:34 +0100
Message-ID: <CAPDyKFq4Q2M=MimXAERtBy+UY79NwLQs8afGWvvXatOrP_LB7w@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] mmc: meson-mx-sdhc: Set MANUAL_STOP for
 multi-block SDIO commands
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mmc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_052114_275870_809DD4CC 
X-CRM114-Status: GOOD (  21.99  )
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

On Sun, 12 Dec 2021 at 16:00, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> The vendor driver implements special handling for multi-block
> SD_IO_RW_DIRECT and SD_IO_RW_EXTENDED commands. It sets the MANUAL_STOP
> bit in the MESON_SDHC_MISC register for these commands. In All other
> cases this bit is cleared.
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
> ---
>  drivers/mmc/host/meson-mx-sdhc-mmc.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/mmc/host/meson-mx-sdhc-mmc.c b/drivers/mmc/host/meson-mx-sdhc-mmc.c
> index 7cd9c0ec2fcf..a89190d479cf 100644
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
> @@ -172,12 +173,20 @@ static void meson_mx_sdhc_start_cmd(struct mmc_host *mmc,
>                 else
>                         /* software flush: */
>                         ictl |= MESON_SDHC_ICTL_DATA_XFER_OK;
> +

Maybe add a comment to explain a bit about this workaround here?

> +               manual_stop = cmd->data->blocks > 1 &&
> +                             (cmd->opcode == SD_IO_RW_DIRECT ||

SD_IO_RW_DIRECT doesn't have cmd->data, so checking for that command
doesn't make sense.

> +                              cmd->opcode == SD_IO_RW_EXTENDED);
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

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
