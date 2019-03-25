Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFDC5C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 17:23:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEAE42087C
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 17:23:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DkmdLC2B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="nXT+XlEr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEAE42087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ySZVfO5lt86FgUnybV2Cp4kM9dpNzpw+3a7R6iKKbo=; b=DkmdLC2Bku2C47
	aAqfcdIqaoBSDlGUFq/nif9fLwR3POwBxaVGCKpdriEvxW3nC0CuHw+LMp+RRTmQ0y3GnyXFatvdl
	y4MQnNDNQOdtda5szMSaPltmm/zCIgi+qd/8GXdNLfiqo0wJn9naAE6qTzc/nhdKUjwfN7Yya9/s+
	xRKuu+K8noK8iCciOXEw+96THVMhgoPfJ7JIu5oCAyzX6SAA4ez0m4FWvsRiqv0IPnhvVW7WPO7b3
	9swJwv3DKXljgizhzwOrIYyo8dxrmJi7bmF6z9rEf/n7rx0ckBVHfNpEyYAZa1/M7uxfm1ROKmq0+
	184PBOj4MYwgeZZMKMtw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8TJx-000890-3s; Mon, 25 Mar 2019 17:23:37 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8TJr-00088F-T4; Mon, 25 Mar 2019 17:23:35 +0000
Received: by mail-ot1-x343.google.com with SMTP id j10so2318826otq.0;
 Mon, 25 Mar 2019 10:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iFPdlKrZ7muGpk/OHmSwyqw31Qc59RqslbAhZWdSAdE=;
 b=nXT+XlErTaEJkKio3UTicMsk/9K83R4WRRuImRdQIs4lNsrRt3BG3Ndvh/mlEoUG0e
 7uQUXEuyaCswEhgjabyTX9RZrhNMK3DY23wdquLUUxBywUVxaBKl+he+y67BLenPhkqU
 WcszlwWZFb13LqKD0ehTaWuaom00wYcGBlIh10F8vH1ie9nR3gE4f0QlvAoK1AbOGJHM
 sDCyq3lT2L7pBPI4QsxPG1D6Ado6ioUdJUJpfbF7DSsqcS0ASLlRcvNolVqaQJWyOqTq
 Db+7ASAtiMz2ZQke0nbtkJYqqigQ1zraI96DBXMWKKnDqGV1LYsOqVfvJVwXWcORQklK
 cxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iFPdlKrZ7muGpk/OHmSwyqw31Qc59RqslbAhZWdSAdE=;
 b=UFcHzQ9y2JaUSDevKTvzw5hYawi7iWxPepe1ABwXFry5xJyhAsI3pD0Sux6kcrzjke
 AKf6OQ4NH4UAQc/GT7mNR6QpI5XW2YjHIoJNMCb0oUirQRI0KpYkNCvZexbYndJsoYKG
 0nksu7z9FN/IQRgKBZVhB3JH3N5evjyaw1galVS8unyt/i7R53dE3JmUt8ULIpj8JB2m
 itRNGjL8nEgDWi9I95Hj1f5HHCDhwS4zD5B/ReHCCyA4V6SPSHhKsd1vm6e7k2OSYkZB
 cdOlI8GIDGrPEyutYNKO8iyFODD7HADmvXGpK2R9givVmUVVLcWkVJMtRXBldcNwZAzy
 FWFA==
X-Gm-Message-State: APjAAAV6Rnq9HnU4XEMhEjw9aRLIeMExn+sfeTOKbH1NQuF6uYc63oNo
 MWG6gwNGKqp2YEu3+m7pgx0CjlnyiTmkK1/bdPs=
X-Google-Smtp-Source: APXvYqyBe3LCDhubjzFRz2zAEjnUk/WiLt2IJi64lWLyjg5TX1XElGcl5bx4COt2YgwOMxSbpbiCjAzhf0PkEW/Qm+A=
X-Received: by 2002:a9d:5614:: with SMTP id e20mr18289202oti.348.1553534605479; 
 Mon, 25 Mar 2019 10:23:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190325101453.3009-1-narmstrong@baylibre.com>
 <20190325101453.3009-2-narmstrong@baylibre.com>
In-Reply-To: <20190325101453.3009-2-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 25 Mar 2019 18:23:14 +0100
Message-ID: <CAFBinCDnYUWzJqA4xukrWLotpYhS1jUSz4TunBBfSsur_B0XoA@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] arm64: dts: meson-g12a-x96-max: add regulators
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_102331_993000_603F1F23 
X-CRM114-Status: UNSURE (   7.61  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: khilman@baylibre.com, Guillaume La Roque <glaroque@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Mar 25, 2019 at 11:15 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> From: Guillaume La Roque <glaroque@baylibre.com>
>
> Add system regulators for the X96 Max Set-Top-Box.
>
> Still missing
> * VDD_EE (0.8V - PWM controlled)
> * VDD_CPU (PWM controlled)
>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
