Return-Path: <SRS0=OcNe=WV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5381C3A5A1
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Aug 2019 19:51:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B92DB2082F
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Aug 2019 19:51:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ED/mF6Ex";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="JrDdoARW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B92DB2082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W0oOagJnU/HgL+M/k3YRqYDooDrQnUBLYJKfPCSzJto=; b=ED/mF6ExhvLR82
	NN3IvulLFY3zmlDyHQ1OQox7gFXkkYzvcWnEVm+vUUnFx6hUjITx5YXXibhlciBq/V+H0491G/FrI
	qAhUiYFgxK5MhcuzVlJmK8iWdJYGHzCizrZ9CxUac6A77Xnv0fPYQgQYDXiDTiDuQBUrZ4+wHU7OU
	ZYjY5e7iByIvle8QxIMXfXMgooOsZcrg4l82/zDYmvwCO5vY5KHLzKvROeOMj+pOR5WNJ8/v9Tywr
	LtnIQWoD8eIQnRa2qeXg23wqOLF2/ITB4x9hQHbVhS9vAqjvQgBc92SYiLkhMMBxCbdZHfGHd+4gk
	igTnOiOcKCeZvSnpCkSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1yY5-0006gI-Km; Sun, 25 Aug 2019 19:51:37 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1yY2-0006fZ-L7; Sun, 25 Aug 2019 19:51:35 +0000
Received: by mail-oi1-x244.google.com with SMTP id a127so10629308oii.2;
 Sun, 25 Aug 2019 12:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hjng6vlLFgbv9Pq9MqHuljD4Do50I8hCQZSgXlEUD+s=;
 b=JrDdoARW3RK4az1cCf/czevGVpc2XlfXp8QUxGdhWyb3hVQORUWD8P3xDDMIDpy3AE
 3KAkLF5yPDxXJXfDCVqf7kuHgDdCRIqIGVn2h2f+jLlHQSQTp64ULV3JHXm5RuQhHD9B
 OCrtDQ8dqbF+NUrvZpRPclVYhN2us1pbugiPBNfbyc30P4xgzUvEY8dUsF+l4zc3tmgT
 q0UmeQYGc3WHoysYNlUofnqCWkg8/k0LPwPDN8+Qz9igplv2xKYrkqK16H+T7IiWs/qO
 zxn+EdozSlAEbQyfaux5mw/6XF2EmAqQGz+TvFuEPhDBsdbr1lJ2EgsLmr2kin//JpJL
 ZSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hjng6vlLFgbv9Pq9MqHuljD4Do50I8hCQZSgXlEUD+s=;
 b=KHUUJbxD6cF6kV6xvJbFk3e0vFBgyQa1Gjr7jyPfK8BORaA9JK4MB6bhsK6Ii3Vbee
 Ymb+tsjV+edj18GznYlLn13Iq+fg352xSCEfqEeyGTWsucDvcPZqNvLXnO18+Eg5zw0M
 X1B0rR1AgHoencYGCwTM2fWnvjcKQlLT30Zgj3pIkKhw5VFX71huuEUUWFhUxuAZ54kC
 /qsXlwggWfGvzaxVIoQkoUahOrRDPRv1v3WsVWcO0d7lQh2x1vH3WkpxQCxcV9fkqXwm
 G/wiHRphSZuNzntODxmeKgrH8rnxmhybKQx6FSX9EHk+FDBJYN31FkMJiP1N9dDAS9s9
 ZTFw==
X-Gm-Message-State: APjAAAVm/C3FhfmNATntrfOypsYRKZ/qXc1TxOS5Zc3LAIkfIVTvixTs
 VRj5qJ/15byjei7xwHeKHbgirPbcpFCDdbuGw40=
X-Google-Smtp-Source: APXvYqytfpz4w1IVT5MQr4MnHby/LbGVf5kKD4Rnq9rK/D7rVL1EJG62FQ5lDoR6ZfEKArVTzVXqRM0d613Y4v6IXcc=
X-Received: by 2002:a05:6808:5cf:: with SMTP id
 d15mr10416816oij.140.1566762693708; 
 Sun, 25 Aug 2019 12:51:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190823081427.17228-1-narmstrong@baylibre.com>
 <20190823081427.17228-3-narmstrong@baylibre.com>
In-Reply-To: <20190823081427.17228-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 25 Aug 2019 21:51:22 +0200
Message-ID: <CAFBinCBLVDVWPbDZ+_cPTbJNCavvzJH4A6U8D9XWVSR-j3fzFQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] amlogic: arm: add Amlogic SM1 based Khadas VIM3
 variant bindings
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190825_125134_720696_CF41373A 
X-CRM114-Status: GOOD (  13.33  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

the subject should be: dt-bindings: arm: amlogic: ...

On Fri, Aug 23, 2019 at 10:15 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> The Khadas VIM3 is also available with the Pin-to-pin compatible
> Amlogic SM1 SoC in the S905D3 variant package.
>
> Change the description to match the S905X3/D3/Y3 variants like the G12A
> description, and add the vim3 compatible.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
> index b48ea1e4913a..2751dd778ce0 100644
> --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
> +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
> @@ -150,9 +150,10 @@ properties:
>            - const: amlogic,s922x
>            - const: amlogic,g12b
>
> -      - description: Boards with the Amlogic Meson SM1 S905X3 SoC
> +      - description: Boards with the Amlogic Meson SM1 S905X3/D3/Y3 SoC
>          items:
>            - enum:
>                - seirobotics,sei610
> +              - khadas,vim3
>            - const: amlogic,sm1
on the GXL we differentiate between S905X and S905D
do we need to differentiate S905X3 from S905D3 (for example)?


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
