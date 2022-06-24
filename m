Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B847BC43334
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Jun 2022 13:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MJftGiXHXrxTDZnmjlhAJA50NnXp3yOU92HafVtUlEs=; b=VRuilDp5+J4JiH
	ZjR7cc26JS25n+X4Ue82jX3heHPoGZNxWK+OjyklwlSWbwMJZjmpCNqcde0Ls2VUwqR9cVoNx/uQt
	njbuyfX5uE0IuKk7R6BwZj+5B0r9IlpjgQrGN/A+qivrmX5+KpnoSSTbjCgvOT7Z6Tywk/DnnvX5f
	YGsBWFVjpt5EEBQxEphC4vebFrc5QxaKFaOvdpnM76eNRD3go3ZMtgF6Lcw0EkZXpXpkIuPnQKY0J
	R8AlbcERuwXfHPknzvE3mXLdzP4pLipAODihdVuHAdrjS/MGci40+1eXiYJW1TOixrom8OsVoSFer
	OpuA1Ta3x0h9O3kpfryg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4jLR-002OVo-8q; Fri, 24 Jun 2022 13:27:33 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4jLD-002ORY-9V
	for linux-amlogic@lists.infradead.org; Fri, 24 Jun 2022 13:27:22 +0000
Received: by mail-wr1-x42f.google.com with SMTP id o16so3156666wra.4
        for <linux-amlogic@lists.infradead.org>; Fri, 24 Jun 2022 06:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=zWXXv2xfX+nkxMjOUNSHqEiFkW+UBo+JFZKk6soP/kc=;
        b=uGlffrhFEfJvrJLAbxs99jYoSIG6r+vrcnUhYGQ77KCoa60uiixo2PtDjOK49BJUvk
         SjVBNUqqtlmWj+KE0yMmHsNcmgfxzutbMBfShyUnG2RIEHd0z6piFMKI16MlhpzdT7+/
         CdaVphHc2+BrEx/7J2q21fax5Ek4PqsRlfY7UreC12zx99xEeBGfJEsv50ARqukmP1ud
         m6nQD2KYDXLiE6KPehCAuQmmfihGciJUZQSt1q5uub0WJSPD5WPb0vaGwOgKZbEvNbxS
         +pxNLXdSQnX+Vr1pL4gkLA8kipTXlDPJib/y1uDW1drFWUeDDSGfkywcwn5oQhFrs8Kq
         /gbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=zWXXv2xfX+nkxMjOUNSHqEiFkW+UBo+JFZKk6soP/kc=;
        b=bhv9YKPUPWzH9IHq5XwQZBxw+4IdUmlwkH4Fl2TPY0FBq0kjd/qyviFyo2KS5sqII7
         /kpHXKJ1Liegn1et1Ca27frnW4KsK7ufORfRIK59lMSmR6sSlSJJYslyQD5FTNgocX/4
         HUyFb4d6lyfjDk5a4Q6sPiAHWQCk+2DDjk3mbQX2Yu8iBXPuf6N1bKj7Db8xpZ8wZakN
         8ouGQVGYPswSJ5mUHFkJVTzG9cvEw52X6l0fHXvQB/j5HxrUdDc0ylNwc8G/DLMwF6Bl
         cLoVo+DVEKcKJJ0ktxDoiDWgbC9mvcZKNU3k9Ev11YkgER1ZId02zQ/2OtNq9q6nPMYk
         VE/g==
X-Gm-Message-State: AJIora+t7rRZQTT5kFLgEHAREUUPANFCG8yZAeCXqo5mSBzC6Kf2hIHk
	BIlI8dcoq7T/6xWceTAxRTwJnA==
X-Google-Smtp-Source: AGRyM1t/ztNcjWHSThDemc1hDzpBMj4/Q0wX6RuHmfYrc/gRO/S83SWB+S0wY81Wi0jJ1cWdECwWYQ==
X-Received: by 2002:a05:6000:1a41:b0:20e:687f:1c3 with SMTP id t1-20020a0560001a4100b0020e687f01c3mr13063677wry.415.1656077235868;
        Fri, 24 Jun 2022 06:27:15 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:3816:2b77:7cfb:ba54? ([2001:861:44c0:66c0:3816:2b77:7cfb:ba54])
        by smtp.gmail.com with ESMTPSA id z24-20020a1c4c18000000b0039db31f6372sm6663231wmf.2.2022.06.24.06.27.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 06:27:15 -0700 (PDT)
Message-ID: <5f1bd986-e193-b147-8322-3a0bf14fc373@baylibre.com>
Date: Fri, 24 Jun 2022 15:27:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v7 5/5] mtd: rawnand: meson: not support legacy clock
Content-Language: en-US
To: Liang Yang <liang.yang@amlogic.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: kernel test robot <lkp@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, XianWei Zhao
 <xianwei.zhao@amlogic.com>, Kelvin Zhang <kelvin.zhang@amlogic.com>,
 BiChao Zheng <bichao.zheng@amlogic.com>, YongHui Yu
 <yonghui.yu@amlogic.com>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220624131257.29906-1-liang.yang@amlogic.com>
 <20220624131257.29906-6-liang.yang@amlogic.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220624131257.29906-6-liang.yang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_062719_361413_5FED79AE 
X-CRM114-Status: GOOD (  14.69  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 24/06/2022 15:12, Liang Yang wrote:
> meson NFC driver use common clock interfaces. so the test robot report
> some errors once using the legacy clock with HAVE_LEGACY_CLK on.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Liang Yang <liang.yang@amlogic.com>
> ---
>   drivers/mtd/nand/raw/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
> index 67b7cb67c030..0ff86ca5932d 100644
> --- a/drivers/mtd/nand/raw/Kconfig
> +++ b/drivers/mtd/nand/raw/Kconfig
> @@ -395,7 +395,7 @@ config MTD_NAND_STM32_FMC2
>   
>   config MTD_NAND_MESON
>   	tristate "Support for NAND controller on Amlogic's Meson SoCs"
> -	depends on ARCH_MESON || COMPILE_TEST
> +	depends on ARCH_MESON || COMPILE_TEST || COMMON_CLK

This should be :
	depends on COMMON_CLK && (ARCH_MESON || COMPILE_TEST)

>   	select MFD_SYSCON
>   	help
>   	  Enables support for NAND controller on Amlogic's Meson SoCs.

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
