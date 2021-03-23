Return-Path: <SRS0=VcWo=IV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48C25C433C1
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Mar 2021 21:34:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D82E961580
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Mar 2021 21:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D82E961580
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lQQpg3TWsaiO5Zxy5WpAVEwa2oaGL3Bu53LFr+RO8vU=; b=mpBuvEXJbP4Bjq1En+OJuMyW+
	FK5zI2hODQPcS3TkU+M72DPwaHzq0FPtUzAfDVxpmMbvrngbVpksfvoBAzLdR/riPRy2bBYi4YSrr
	0ofQi6w8Nz7O99Oi/v8dV+QQnM/7pzjBzGjLhSE0lrw9/Eauh0mSOo/dV8dRCsModQ7VPmkh4DODs
	r6m72U38FXQ+1TtO496c6VLnCcvQkW0hvYcTZfdZFzeF5se9Vw2R0osPKI6zToPFrD6KUFmfrcTWr
	uQOIYpio+FZekYDcGsmkAP6r8deUXt73J2yFyt0v5875S+/Y7lkiNOvzDhwfHGDndh2qEZfI84DWD
	YrEp19QoA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOoem-00Fmuk-Aq; Tue, 23 Mar 2021 21:33:44 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOoeV-00Fms1-NF; Tue, 23 Mar 2021 21:33:29 +0000
Received: by mail-ed1-x533.google.com with SMTP id z1so25251538edb.8;
 Tue, 23 Mar 2021 14:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vNqTp+4J55pn8UtxCWhZI9WKQ5OJTgrthkxSNaaR9fk=;
 b=Z1X62JgaNMMBhLZQ4QlhpGE30R7oq8YUDzrEMEzTRD0vNkPaAU0FqGpgvMQr3SNw4N
 TQ2lURRF9XEcvjjsQtWoYsO7GtMMtlQB/pagSghOAntjFN+62FySADdKePG/SaNFdkTw
 jjRiQNIFaAgrove9trejAd+bh2AI53ZwBbeUGI+rGNQUgiUDhrqm/52yIa8mSOHbRADc
 /Hl8zXqJYmy5UllL/i5DfDsUENesGkIKUATnioFFGXBBjUtDvmeZiEaQGPAi+S8F39FF
 81WLl9okrNOK9J9KAS05Up2FL0aVT//x6QW9B21AIw6AHfDL9xjBkEvHP9LtW5QOQSL8
 tjEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vNqTp+4J55pn8UtxCWhZI9WKQ5OJTgrthkxSNaaR9fk=;
 b=p+mdmZgqd7yuyu+pOic0dXczQBKU0dYqJKoNnznFbQW+YZxChJCbn/y9xbsDWf4rmg
 3fsA3S61e+dBmodKnvFNZ5Ta+T9+IbG8mnPrC3sa5r3ip6j8FN0f9j17rFas510MdLqM
 9gVlzwFXpdgSJDGKHPhomfum79HXCGTq6ZAuLPN64WJb5TKxDb35RNXvuR4aI5CqKWle
 NZswfuJF56JbnQyHyr/pQsIaTyajanvi/LUDYSu+HEcsbhoh81zcFSlo06qfFN8xuvaU
 zPN40P6aWCtsqTUYvbzAAIn8T+FwWg5ETrrPlgjNR/JVQ61s9SG1LaV0P2kYbvG7FOOq
 kKqQ==
X-Gm-Message-State: AOAM533T9b7G0ACNdUHPIjKEAGMnzmkJ/N3vXBTtATNbxklsyVaqZ/Xj
 oGAua5P+fx2CJ/2JTx6i8jr7SMtRf9GrwskEkHo=
X-Google-Smtp-Source: ABdhPJxogLUC0j2kqIXnvE9ADeLdHe/dekVrvsjIiVez5mN8mdmstjeRi/0IbcBN4Amm2vqsw9nN/TGoA02CccJ8wno=
X-Received: by 2002:aa7:c957:: with SMTP id h23mr6431368edt.301.1616535206608; 
 Tue, 23 Mar 2021 14:33:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210315083459.359773-1-narmstrong@baylibre.com>
 <20210315083459.359773-2-narmstrong@baylibre.com>
In-Reply-To: <20210315083459.359773-2-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 23 Mar 2021 22:33:15 +0100
Message-ID: <CAFBinCA1WhtWLEfJ-QyBbZpsY75r=su6uzyWamY6nHOQ+HYvAw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: serial: amlogic, meson-uart: add
 amlogic, uart-fifosize property
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: gregkh@linuxfoundation.org, devicetree@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_213327_890718_975F154E 
X-CRM114-Status: GOOD (  16.64  )
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

 Hi Neil,

On Mon, Mar 15, 2021 at 9:37 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On most of the Amlogic SoCs, the first UART controller in the "Everything-Else"
> power domain has 128bytes of RX & TX FIFO, so add an optional property to describe
do we still need wrapping of long lines in commit messages?
if so I think the line above is too long

> a different FIFO size from the other ports (64bytes).
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

one additional note below

> ---
>  .../devicetree/bindings/serial/amlogic,meson-uart.yaml      | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
> index 75ebc9952a99..e0a742112783 100644
> --- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
> @@ -55,6 +55,12 @@ properties:
>        - const: pclk
>        - const: baud
>
> +
> +  amlogic,uart-fifosize:
> +    description: The fifo size supported by the UART channel.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [64, 128]
I personally think this is generic enough to be described as fifo-size
(as it's done in Documentation/devicetree/bindings/serial/8250.yaml)
let's wait and hear what Rob thinks


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
