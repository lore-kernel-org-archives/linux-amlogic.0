Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F5DC77B6E
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Apr 2023 07:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UJqIzzUOI73c+/iTSTmIfk+uf/hLNtM4F7kmo+x3+MM=; b=Hg3vmV1j1+9lEw55dVU7U6JdXm
	y/Pzky4PPW0KKpI+zlEoMWy+ErERNBMNchBm2OQv1izb/NBu4BLv0GstTZE634g8+TF+Z1QO7dvTl
	EoJYBpG+GOIfalvsHGdS8aKaUBOGyJ/t7DHYt2Us0Dao27EUEKWnOrKspj3PVvWoZ9yx9Aa7wOvoH
	kXiGKMP54cG5fRnzfDJBmHSKiNGtyenXtE44ZvC65kDwzFacmX5yoRV6w93mCNQ4+lvj30ifwZ1ac
	zdrZ5LuNzhXosO78hCHbxccVa7bBsKWOmXCI6f4DnnvAvOuyUoIfjXOW7oxQ0YZqtcD6LsicpGTn1
	jvME0mRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmV31-0026tT-21;
	Wed, 12 Apr 2023 07:37:43 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmV2y-0026s3-0A
	for linux-amlogic@lists.infradead.org;
	Wed, 12 Apr 2023 07:37:41 +0000
Received: by mail-wr1-x42f.google.com with SMTP id l18so9829679wrb.9
        for <linux-amlogic@lists.infradead.org>; Wed, 12 Apr 2023 00:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681285057; x=1683877057;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CiF0mgU3/wD4pOn8H8hIqODLGj9JpvM6ISvsGRm0Re8=;
        b=RLM3qCOQYqUPqVlPl8GisAhq+i+qQ/Sf6zrRu4Pzx1bd/n3BJi/0ckvwQwk4bRa48w
         EcGKdZaG4z1jPm+MlRHSKOBx8bpnGjDp/8N/ZAk3GSw4g6wn4Ts2ljabxfXI5QDykNIS
         h8iGcPEcpbvavlZlNimUXGW5ELFvoglmIoWIYZRw5ZufVm4s83F18DZLfAoHwM1o6xSU
         m2aiAQ3oV8zRIRZczC7FTx7Ea2+K+vkGcmRgSewLxkQ81SanMCH36vPICKebxCuzDP2K
         dsiqSZ1H2GQ540pr5YimAwwEUhvgXRDzjyFWwPHAzwW2soKFcgc6yNdqXBszFobtNeAr
         BLpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681285057; x=1683877057;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CiF0mgU3/wD4pOn8H8hIqODLGj9JpvM6ISvsGRm0Re8=;
        b=pi1cnF708W+HCOiOhHHI1+MkjfqFRMeamLsmOaV0XJOMNfuF2OwYpfkFHD6+Kw5dAy
         mAOGgh6t/e0SVRyRCObcD+8kWpOY3kflcNi4wE/Rem1FD+UpRBeIh90HlkzLhutOBD5R
         Cr+3l48wv0yYtcLMC4v0KDTjRNyGkTgnCV8QNwJ5APyp0SVLuO3ZwN6KHXg0arrxOFdT
         EPnbpR8uwusk8BrPaLfJ/SJ0GmpOx8/ZrWVp/5Wfro9o07c5FDr4uj08tiURKBkV8Hkn
         DjCIEvqRALjMe9TAOgEk7Qk9GiBEnKLH/Rw8VYMeKKcvuE0hD5xejxfr1pADgbK2PHjV
         EeVg==
X-Gm-Message-State: AAQBX9ekiSa1sRGzxB3ZKTpZabsiPqQ3FpCTNRXafdun9taxAitoHECG
	Fk6vl+X3TnMe+sszmpCrewbjfw==
X-Google-Smtp-Source: AKy350Z/SLp317LxYEPlad+keulW3xjgxVXR1yy97XsOkHvy0kkKdPqlBPYhSQtIfSkn6yBlVfwwXg==
X-Received: by 2002:a05:6000:c:b0:2f4:f2c9:171b with SMTP id h12-20020a056000000c00b002f4f2c9171bmr59898wrx.17.1681285057178;
        Wed, 12 Apr 2023 00:37:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b777:4c24:cbcf:795f? ([2a01:e0a:982:cbb0:b777:4c24:cbcf:795f])
        by smtp.gmail.com with ESMTPSA id l1-20020adfe581000000b002f22c44e974sm6598619wrm.102.2023.04.12.00.37.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 00:37:36 -0700 (PDT)
Message-ID: <055a9886-ea3f-6df2-f4a0-a3eff47e6b69@linaro.org>
Date: Wed, 12 Apr 2023 09:37:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 2/5] mtd: rawnand: meson: replace GENMASK() macro with
 define
Content-Language: en-US
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>,
 Liang Yang <liang.yang@amlogic.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Yixun Lan <yixun.lan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>
Cc: oxffffaa@gmail.com, kernel@sberdevices.ru, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230412061700.1492474-1-AVKrasnov@sberdevices.ru>
 <20230412061700.1492474-3-AVKrasnov@sberdevices.ru>
Organization: Linaro Developer Services
In-Reply-To: <20230412061700.1492474-3-AVKrasnov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_003740_112501_60203E88 
X-CRM114-Status: GOOD (  15.00  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 12/04/2023 08:16, Arseniy Krasnov wrote:

Please add a commit message

> Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
> ---
>   drivers/mtd/nand/raw/meson_nand.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> index 256c37c76526..45b53d420aed 100644
> --- a/drivers/mtd/nand/raw/meson_nand.c
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -110,6 +110,8 @@
>   
>   #define PER_INFO_BYTE		8
>   
> +#define NFC_CMD_RAW_LEN		(GENMASK(13, 0))

Drop the () around GENMASK(13, 0)

> +
>   struct meson_nfc_nand_chip {
>   	struct list_head node;
>   	struct nand_chip nand;
> @@ -300,7 +302,7 @@ static void meson_nfc_cmd_access(struct nand_chip *nand, int raw, bool dir,
>   
>   	if (raw) {
>   		len = mtd->writesize + mtd->oobsize;
> -		cmd = (len & GENMASK(13, 0)) | scrambler | DMA_DIR(dir);
> +		cmd = (len & NFC_CMD_RAW_LEN) | scrambler | DMA_DIR(dir);
>   		writel(cmd, nfc->reg_base + NFC_REG_CMD);
>   		return;
>   	}
> @@ -550,7 +552,7 @@ static int meson_nfc_read_buf(struct nand_chip *nand, u8 *buf, int len)
>   	if (ret)
>   		goto out;
>   
> -	cmd = NFC_CMD_N2M | (len & GENMASK(13, 0));
> +	cmd = NFC_CMD_N2M | (len & NFC_CMD_RAW_LEN);
>   	writel(cmd, nfc->reg_base + NFC_REG_CMD);
>   
>   	meson_nfc_drain_cmd(nfc);
> @@ -574,7 +576,7 @@ static int meson_nfc_write_buf(struct nand_chip *nand, u8 *buf, int len)
>   	if (ret)
>   		return ret;
>   
> -	cmd = NFC_CMD_M2N | (len & GENMASK(13, 0));
> +	cmd = NFC_CMD_M2N | (len & NFC_CMD_RAW_LEN);
>   	writel(cmd, nfc->reg_base + NFC_REG_CMD);
>   
>   	meson_nfc_drain_cmd(nfc);

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
