Return-Path: <SRS0=cPU3=MG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03C9CC12002
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jul 2021 23:43:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9C6E613C8
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jul 2021 23:43:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9C6E613C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ni4dD9BxFYv659GTBP9YUdLw/FAirZ6RA+rYtmuGqi4=; b=s4WsdvzAdmLuZA
	wOZza1LSDV1gsFYxxKPgC54q+77t0iiYNxiOkYJG2ZKfphLtqOZZupu9my2UxDV5EhhA3HnVEQhjy
	aaIN76snJEMRCcytK7/PkR/E6CJ8NuZYq4sj+msQse2Cz/6ehaXoel1pRKunx2ufD7QZmk0o84ayw
	5FnYq1JQlaOhJvX/XOEcguuyyir5Lrm+f5yAl2RM4vpotDwwfIBzdQBWTtQIrcoR1jt0tCIuRmHkD
	O6AzBox+JNpVAdOVzieEAwnwymBzH5Groi7Fk3NyOwwFjt6RKGCYfGuQbpfcWlfr6RGizyFiGSEcQ
	AcARq3IFGt+o+wjnzNhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3oWw-00GO2L-1E; Wed, 14 Jul 2021 23:43:06 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3m6R-00FH8C-No; Wed, 14 Jul 2021 21:07:37 +0000
Received: by mail-ej1-x62c.google.com with SMTP id ga14so5511443ejc.6;
 Wed, 14 Jul 2021 14:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uKs08PKA3zHnZYiqGFTlV7FYCOVvxTsZbzcVqjAcgso=;
 b=bIQtaIrN/M5zSK25RG9pKNDG5gguoJ9kFWmyyfhmFDbrM5Il0JoSQJo6mZgQXQ7NDS
 7bEdL2/cWvk88mbaPoakH6ghNPsiingIj5ePUEXeFb3ZFGUR+DZu6vUHZhBtnz9qQ4eo
 U8/D0n9TvsHmaXhb+gVynZJaBUbs1KBuy01aAPLjDt/DmvuKngXzwrj8x8JbzR/PKH2E
 4/CY8V6MSQeeF4ouGNTOW0QG8JrEuR655z69wyserrW3acN8CriJuGIClx0RlGERDRro
 TohwQKVQjW4wacwyV99j/0zgkK/J2L2kzjt2ImS5Ri4cGz6diGmtzN60BX5SKoWGO7Dy
 WZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uKs08PKA3zHnZYiqGFTlV7FYCOVvxTsZbzcVqjAcgso=;
 b=iE/CB1UzEygSzVPSauqbP1a0yfi9rCDDKFUEZHVJ+X8xjvr5wR0d3a0xyAVLlrxcyI
 p9kyR5qXl5OHGJmZbWjz6h13lQdd7EHcV+D8LrZFFB31PEbfFxoGYO+qSk8HJiILqb6S
 WmCDQeS4QeB0VQPFLXf6qZ4zJzszzT5qkhtRBc4P6zKe3UwkHSfHgbVTlgyEcGfUpce+
 iOisfiuBmRR3mVqF3D4uUMqXC2chyTMFXCnvj9CvrZ/ifSYIsvEp/+Pp609ZL5YXAIw0
 NZhadTu8aGQ5mJToK2YmoORr1hrh0APjiA0jtfhUbejqZVRHsUxFSRVGYwrvthZKVNRM
 oyVA==
X-Gm-Message-State: AOAM5323Ipy0hpGdmRxtG1KQ45oAn0Mh72YVNjkePPQfdVOKCjJWbrKm
 1Ov08p6G4WXyhOYCu6BN5h/WD2WYqW4vghM92FI=
X-Google-Smtp-Source: ABdhPJx0IdYLqpL/ZbZ0z85Rkw9C0uhJ0kkps6LzUM9s1hcfPZrydzc/r/r/1A//ysR3OnjacLyMNks9BArwNjAbCjw=
X-Received: by 2002:a17:906:39c3:: with SMTP id
 i3mr141055eje.527.1626296852680; 
 Wed, 14 Jul 2021 14:07:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210714134540.1722-1-linux.amoon@gmail.com>
In-Reply-To: <20210714134540.1722-1-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 14 Jul 2021 23:07:21 +0200
Message-ID: <CAFBinCDN+wTU24tfyqH1nbxm72h7aT960beKkKE54dYGe==DNw@mail.gmail.com>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Enable CONFIG_MMC_MESON_MX_SDHC
To: Anand Moon <linux.amoon@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Shawn Guo <shawnguo@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Olivier Moysan <olivier.moysan@st.com>, 
 Manivannan Sadhasivam <mani@kernel.org>,
 Grygorii Strashko <grygorii.strashko@ti.com>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Florian Fainelli <f.fainelli@gmail.com>, 
 Lionel Debieve <lionel.debieve@st.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_140735_868238_13FC6406 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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

Hi Anand,

thanks for this patch!

On Wed, Jul 14, 2021 at 3:45 PM Anand Moon <linux.amoon@gmail.com> wrote:
>
> Enable CONFIG_MMC_MESON_MX_SDHC so that SDHC host controller
> on Anlogic SoCs boards enable support for eMMC and MMC drivers.
typo: Anlogic -> Amlogic

> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
with above typo fixed:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[...]
> +CONFIG_MMC_MESON_MX_SDHC=y
note to myself: =y is fine here because booting from eMMC requires =y
instead of =m


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
