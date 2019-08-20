Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54930C3A589
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 20:32:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24A1C2332A
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 20:32:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NABSAw1j";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="n+cxQw3r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24A1C2332A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=84XMAGNBcQVYpA6koHGRE7FK29qHlHXq9FT7vADtshk=; b=NABSAw1j5BBE1j
	XisfS25bW6AfN5EJoBjL26DJIFTzUf27fXWrhNNuekwekTm7jUyz61s/yKc50OpL3w9KrtnFSMOaI
	nvbD2adXHuwZn9UpKiFTZaBxygXw6PaPEkRUFCXAM6lMVAcg7VqdQmKAYJUNRM44XnBVVsdLve0Eh
	g/hMeFBrr7UmAVwN746hDdzATKFfTuDRuqjmUH1Vm3gL1Im0E8bPvccUZmIWt/98kBV9zS5Xuhxji
	HswNb8pslA7JPw4X376tt96m4ovzA7P5+qQSEckRWAdlsf+5j6wKQ1y7NE/74d6H6WaO2DXj2sXZB
	MtyJ+orvk1ygAOLXqlsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0Anz-00023K-0o; Tue, 20 Aug 2019 20:32:35 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0Anw-0001vk-KP; Tue, 20 Aug 2019 20:32:33 +0000
Received: by mail-ot1-x341.google.com with SMTP id e12so6302651otp.10;
 Tue, 20 Aug 2019 13:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w4HEgBYUNMjs7TCGrEWBfpxm+fwdeijgHXxiJ5I4qeg=;
 b=n+cxQw3r9VdoH9z0HdR0eilm17osw9+QEpFNwmZyyZFQyLtKBjk5ogmKv1iVsFoxFs
 UXgLHSU19Xa67oICY4zD7N27i4et6wEO1NrslqYR9VlQ4oq6UFjPSsAWTMUkrCNGjnD/
 0xQYZXJvbb3wgElE6Cb2YXgKtRwBnOX9gLFFEBu2t0ePNg8ysube6AjuGP3wTjq8RPyA
 vUj5AvC4fySAKFJ0gJXAXdZN69OkaMqoj7TAZpVRHsT9/e37iXrJ7NggT1ZknqeYmDUk
 vaIAe4lJcC1bISZQCqGRRH8putI5R60egJIKazx3OjZpsCCgEBBGfwI2YtXcD4JJ6fVd
 UaDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w4HEgBYUNMjs7TCGrEWBfpxm+fwdeijgHXxiJ5I4qeg=;
 b=GkSi27RruFtOk29sTtaIFofA3LGEuBR6Cm+zu5muPKyjfU0o1dKCOJP7ajZaLqMz6E
 yuNEsxrJDlrhZsC1bzI8g6GYuDlw0XTI6QNV2eXdHk6qX53JxuZ+VXgNHkbfRHXcMFTg
 sQvckRmsqNR0bcJQ+b27ovNxCBSsHomE5NlMjc3gpORnNQNpFEZUkCKL+esuU+kW/XyV
 xBqKSdUs4VXrybaEXm1f+syHJNcWzyowjrf0nTV+2ZS4h7qhx10TairVZ8OZkemi3ctU
 cm7ivPcoEDlfSvCUigYoFALCLLRRODVqRpOjlF7wr4FqJ4spsWnHYP7tNnBQFsBsb1g3
 nojw==
X-Gm-Message-State: APjAAAVjffK1S0OEzpy9zySZqGzBzbBX7IBw3KTij0btAFkS9spoDYe0
 NaskjK5Hbn806mdJ8FWSb76yE5V/zmkzPyz3vefQyvI9
X-Google-Smtp-Source: APXvYqxlvVNpQ+FUnoPDePRzlt/lxOoZg375AfFU3rjHLbAwedqV9QU2sqj3xfsgHWhpAmkjk6c5OkDmuYet9+FYRHE=
X-Received: by 2002:a05:6830:1e5a:: with SMTP id
 e26mr17408901otj.96.1566333151468; 
 Tue, 20 Aug 2019 13:32:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190814142918.11636-1-narmstrong@baylibre.com>
 <20190814142918.11636-12-narmstrong@baylibre.com>
In-Reply-To: <20190814142918.11636-12-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 20 Aug 2019 22:32:20 +0200
Message-ID: <CAFBinCBWFNJNAWdeZ2LfEJA-MVpSf-A5SrLZEx+0z_P+-iBFDg@mail.gmail.com>
Subject: Re: [PATCH 11/14] arm64: dts: meson-g12a-x96-max: fix compatible
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_133232_675050_B138FA0A 
X-CRM114-Status: UNSURE (   8.60  )
X-CRM114-Notice: Please train this message.
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
Cc: khilman@baylibre.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Aug 14, 2019 at 4:33 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This fixes the following DT schemas check errors:
> meson-g12a-x96-max.dt.yaml: /: compatible: ['amediatech,x96-max', 'amlogic,u200', 'amlogic,g12a'] is not valid under any of the given schemas
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[...]
> -       compatible = "amediatech,x96-max", "amlogic,u200", "amlogic,g12a";
> +       compatible = "amediatech,x96-max", "amlogic,g12a";
only partially related: I wonder if we should add a s905x2 compatible
string here and to the .dts filename (just like we separate the GXL
variants s905x, s905d, s905w, ...)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
