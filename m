Return-Path: <SRS0=Dvvs=JX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C336C433B4
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Apr 2021 15:19:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA91E6135D
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Apr 2021 15:19:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA91E6135D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5xhMAECBaWixmlShXJYhnEHKRmD5FdQxGP1DGeaiEXs=; b=TyXzM8KZGgitD5QuQUQQbISPP
	SjV1sMdEyxIFLrbin6G7geV0RYc7DXrQtXh1UpGz2OXp1gC1anmiRCibdgZRYabDPmiksVb8KmO3c
	RywbASLuczwYm9Eyi1jYu0pOcjy/RbYeyp8XcE8u3JUCYR0G7g/dAoykEMogElZLFi6zR5NdAsOQ9
	DsiQZA884KssOg9EpxiX9pl9ONyPmCjRLTBeq2eg2LcmutZLkG3Dh8XxRQ7YdGY7Aef3Tacb+54j5
	Ak1Z+Af/PFXfuILB3fMhoPe4cF7rFnO3fxbhkQw77XsBgfzGxeZPHmCDU50dH/gWEDVfG8WxA81Ix
	Etg8VUYRw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lb315-007x0I-Fq; Mon, 26 Apr 2021 15:19:19 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb30p-007wxu-Ar
 for linux-amlogic@desiato.infradead.org; Mon, 26 Apr 2021 15:19:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=d7c910HdFIDkEZtBVmU+xya0RUVFfE7u0NPc6LnaV4A=; b=n+rZR0UABhquAqShekoLJB0jyB
 2PtpZBjoXSFzC+U6wA/2Y1Ljcxt8mPdANusYPne5HPy3zYyL9iKzcLtLKWflD8Z2+SPPSWuEXLmgI
 AHPz/fRHadUHAD8dNtyxWPktelykNuRAfkKEVj9Qe03y4CVZsffB8RSyl1uP5a/qFmcvWfuuVc2An
 mNYsUhD94P5KtmzmwOkRceyp00hZeShceymCdh6kk/cp5GCzPOdcw2i0wrZvu9TmUveZqNoaNkd7W
 E37TT9vvZqsCx/Fw537g6zjfHFNK4nXojzuJ7o1g8az5tJu9MUGFuH7otXzb2i5T60dghE41YTMns
 xxMhJPfg==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb30m-00G2eV-2I
 for linux-amlogic@lists.infradead.org; Mon, 26 Apr 2021 15:19:02 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 b19-20020a05600c06d3b029014258a636e8so1121157wmn.2
 for <linux-amlogic@lists.infradead.org>; Mon, 26 Apr 2021 08:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=d7c910HdFIDkEZtBVmU+xya0RUVFfE7u0NPc6LnaV4A=;
 b=zPI+wHnjxVRqB2h7HkKFXWNFbszfV2rYGIDDv9QRZjNNBzvOK2tGd9/nLf9U2zVhWL
 zx4JePmNRfZLB+aX6PDlMI3hp+L1GbRMyIfzteWIDwaHNxfQDG0b5mwcwM4I/K7uBrBg
 ruKzOXdtaFfXnlal6zJHaMxq3OCdD65IjjGrt5zx/1X9KXDEFJcMmKuFfqUbEMXTzdEJ
 bQPv4CBh+tcPHBf+oaQls+ZuzsDoh3+e1TxKSuDB0+JpULtVcjFww230XNhmKSmKNi8P
 pYqLoBQwcolRQx1/tIIwNAKPLzeUJn9kLQBMtGD9lZUcqaWWnNrIAFWeocS6sw6QUVvY
 drBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=d7c910HdFIDkEZtBVmU+xya0RUVFfE7u0NPc6LnaV4A=;
 b=JlNjuGfYDny7a7fbrqHU938R00GLIh7b9bqtpFvA9nynO8oNWzeCrDLPBIyw9yRS6+
 yAIASsSkxh/4vgfnZ7F+5cE28X4W/+ObXhF8M6lgLjkCxzpoW/LU+S+u3akv/T0Qr+l9
 zPg0fIkguTkBZemMq4cxahwZXFe7/qCDgVUQIRbDvyA8K/A/9ms+PZORDfw4StFjTpm4
 qkxCjLg0pEywvK3QW7FHSrUqG2qWX/VsP1g0HSgN/am4nhz10ACy1/sAkjEe2P/d5im1
 JektZJsI1bGKAwDSr6GLql5HK5vNuWVzXGfPgpb7IWs6YUFm04BWtNPgZMvnzQ0X18O+
 TpeQ==
X-Gm-Message-State: AOAM530IEX7SrkMND9l2YyJJnxW+bIxzHsul+1kVp92Of32V2yq87B2+
 9Ax/kNLJ+uSaa0EC/VPjVSaEXQ==
X-Google-Smtp-Source: ABdhPJzeVCEu0G7/KsNN5GV0idVuXFvH4c6Dd8NZqnG4S6Uym6BLFUkIBVE4h4nvQDzoIvKiCcOaug==
X-Received: by 2002:a1c:4382:: with SMTP id q124mr12824636wma.63.1619450337109; 
 Mon, 26 Apr 2021 08:18:57 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id h8sm15920060wmq.19.2021.04.26.08.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 08:18:56 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Colin King <colin.king@canonical.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Neil
 Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] serial: meson: remove redundant initialization of
 variable id
In-Reply-To: <20210426101106.9122-1-colin.king@canonical.com>
References: <20210426101106.9122-1-colin.king@canonical.com>
Date: Mon, 26 Apr 2021 08:18:53 -0700
Message-ID: <7hwnspysyq.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_081900_176381_1173E658 
X-CRM114-Status: GOOD (  19.84  )
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

Colin King <colin.king@canonical.com> writes:

> From: Colin Ian King <colin.king@canonical.com>
>
> The variable id being initialized with a value that is never read
> and it is being updated later with a new value. The initialization is
> redundant and can be removed. Since id is just being used in a for-loop
> inside a local scope, move the declaration of id to that scope.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

> ---
>  drivers/tty/serial/meson_uart.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> index 529cd0289056..d7f55031b2cf 100644
> --- a/drivers/tty/serial/meson_uart.c
> +++ b/drivers/tty/serial/meson_uart.c
> @@ -716,12 +716,13 @@ static int meson_uart_probe(struct platform_device *pdev)
>  	struct resource *res_mem, *res_irq;
>  	struct uart_port *port;
>  	int ret = 0;
> -	int id = -1;
>  
>  	if (pdev->dev.of_node)
>  		pdev->id = of_alias_get_id(pdev->dev.of_node, "serial");
>  
>  	if (pdev->id < 0) {
> +		int id;
> +
>  		for (id = AML_UART_PORT_OFFSET; id < AML_UART_PORT_NUM; id++) {
>  			if (!meson_ports[id]) {
>  				pdev->id = id;
> -- 
> 2.30.2

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
