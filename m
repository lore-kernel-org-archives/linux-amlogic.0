Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFCECC43218
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 20:23:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C3E720645
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 20:23:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r5IqSCFq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="mSV1asYv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C3E720645
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EJ4IiuZlRZad7tYYQkZn1kQhhbZ4XrO7ntirqW0xkN8=; b=r5IqSCFq/8uogo
	Jyuic25nyJNsM+uxLjWRW9bBZgLetMj5Fp3bQhaKA4MDK851u6U8JjHPgGsv+OVzEoGrL48O416bA
	4PNQuUXUgHhjE7u4yT/cY4BByhS0s4JMD2fVt2UrubfYkLAzKXLtQicgwpoTOh29C4C3Nvh2265rt
	EhbrxmM+qDZ9DfIJkamqvsmZgr3VHtiKUKkjde0whnfIMDRKEjBPlBfCve4OVETIuRnOo0DG/BT1d
	5pdDa75EfkF9CisT/1h3XLQD68mgX21GPfGWBc4wujRmdTbBiaTqOFJehcsRwTftZM9i4tbq35isB
	vH8nZepjUf/JFc+cVbFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKTr2-0002gz-UX; Sat, 27 Apr 2019 20:23:24 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKTr0-0002gY-Fy; Sat, 27 Apr 2019 20:23:24 +0000
Received: by mail-ot1-x342.google.com with SMTP id t20so5533222otl.5;
 Sat, 27 Apr 2019 13:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uJgD+pL9W7Px5skVpUJDUZ1yvSNePMr+f36/qtWiwqI=;
 b=mSV1asYvFd1SpvBS+eVyXagB5z5UPgZShzDKHeaL/gYAe1R9F/cyVd4Wn5lX1xVS6s
 /6XXHkc+KSwGRWpqdgNvoTjVR58aJkpgZZjA+P0lPqUXluNp06V3nuo1KLIeaT95eAHa
 VExtIEajTHifJInirjb2OCoOdgixVGyGFu4cWdetigUlE93zjAQN4M3tCz+j7HWku0j3
 otcrgaZL7pGLxESDI/eupyDEFVqDsEnwg9wI084qMbHZLm6qRn2SbrbJmVf+EoSQVsLu
 bpcu2oHut13nAKlnHJjd7ElBR7CFNflQ5poefMM+JeEx6yuWibo41yWVdBMz53lKysa+
 1c1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uJgD+pL9W7Px5skVpUJDUZ1yvSNePMr+f36/qtWiwqI=;
 b=m5WMfJksRZ3+Qi8Zj72L5JAlLm0dor1dppZ2Spw8oE03LdAN4h9kSl2V5HTk2fE5HO
 6YyO985jiItcVCSbFDHm+EvDFO1HiEbu+bAJrKq1DSwL1p0WSSSGcA+hE9Tx5PUROaS/
 eBz7u7tvJL873ccTGFkxh55v3XUT25MdRSvGcIJfLu8m43oII72RIMnG3O7eZjn3rOsi
 UVGSbQ5/BiboFy93VXvZEpa1NzisyEMtsQCMXGDre/R5tUrJJN6/g/QRnMX5rKavuil/
 liEdiXFZir3w9Bav3yDIZ5V84MclSfLiQW7+nV+MYzG3kZ+LxSCM86/nWeVGAH0dQEjA
 IlVw==
X-Gm-Message-State: APjAAAVmObtBx5iu0iVzyOY7QG7m6q3wW864pBLs7NHsODjfn4Z0Y/cL
 RaUSuYFvBGDTu64xXRRwIf5mJxg5SUUy804Pgz01zVAJ
X-Google-Smtp-Source: APXvYqyXYDlYXJ5hEDJFecpKSBEoTRt9zgmKmzSy5qHUmuTaeGBiyYOrwCGgC8Nz/Jmw+ECl8TNZ0LqnPtkDpxTNgvY=
X-Received: by 2002:a9d:3db4:: with SMTP id l49mr32899960otc.131.1556396601630; 
 Sat, 27 Apr 2019 13:23:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190423091503.10847-1-narmstrong@baylibre.com>
 <20190423091503.10847-6-narmstrong@baylibre.com>
In-Reply-To: <20190423091503.10847-6-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 27 Apr 2019 22:23:10 +0200
Message-ID: <CAFBinCBmO5JYxFuDZ09rBhQz64skNczN+ST7MGC6vPt5jfDArA@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] dt-bindings: arm: amlogic: add Odroid-N2 binding
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_132322_528226_C4E2E778 
X-CRM114-Status: UNSURE (   6.88  )
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Apr 23, 2019 at 11:16 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add compatible for the Amlogic G12B (S922X) SoC based Odroid-N2 SBC
> from HardKernel.
nit-pick: their website mentions "Copyright 2018 Hardkernel co., Ltd. "

> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
