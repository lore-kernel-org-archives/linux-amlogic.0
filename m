Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B83AAC07542
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:19:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9427620859
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:19:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jPNNRFdL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="gbV3rcSa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9427620859
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PJV5cJH+K2kkldFQdK/9ehQzbF1nIT8plIH/LALfuss=; b=jPNNRFdL68N62a
	s2Npv6T1JdR25zLyXSFevZIs99/hKbIfo+Lp0MWckWTt80kW/tAG27tcoDEzUi48Z5H6d/6j0ZkjU
	p/93CvsUP8V+ylAM3Cyz+jAxzIfdNZNMJp0NVNpIbyDmL3AgAs+h5XQ8ORiyu0AdAjkdsVB3jz5hh
	oP9J53MjYTcT+O0g+Ldxm0cFinNj2OhJl4oAcx2bjYq5hGdUJ6eMfEsKr5O3LTHG0NNkFGrxhDimk
	Jh1tmzl3ajs0y7mold/ril4W6gGyEPi1fjOmMzzMhRLalpJf6M4Z18u1MsQEvtJvxb+TcU6Q4efiD
	R9p8m1wuceNGgMD+bfiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVKDs-00034i-AI; Mon, 27 May 2019 18:19:48 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVKDp-00034B-GM; Mon, 27 May 2019 18:19:46 +0000
Received: by mail-oi1-x241.google.com with SMTP id y124so12471775oiy.3;
 Mon, 27 May 2019 11:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=REA5zbty0xHe7KtmiN42aAu+VNT3yUAx9IRSmGEhNfk=;
 b=gbV3rcSaNWdBb7ut8i8munG9MXAOo1fy/pLLtM3+3QVqU5C1gi2Z1GBTBAgzs8hgPf
 8cptcKIa9Io9RbzWpXy5PMaVA7P8xJwtzv4ARVL/60OtrdBRKOglUTb3ZgcbrCY0NH/1
 6zDVtmlqq6MRXVJvYKO57yaEGQThkUOsq7us9n35ODeZFrsL147+GXbEO2qZMCvp1fDu
 3EcCdn997nuGb+LJbAaHSESI41byavV3pUN5qol4IX9CQ4H5Xk0D2w957Qu6Ssl7yhHR
 EYw5ll+x1heXuUotikVRRDhJ5Mntrh73wusDulQvKzIeer0WrL6mBbR19gbHS6giiYwf
 wASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=REA5zbty0xHe7KtmiN42aAu+VNT3yUAx9IRSmGEhNfk=;
 b=cwDoVMRGJ8egRr+Z5Q9UfZ21Lz2c2h3TsAjvFA8qAJb45oCB5wWor8P0brIhzN/dQ3
 kx0jR+03zIU2LNIQWM88BOQGorcsO/QLTrogbQQTwurvqgAioPa4nZZSC7ewGKHk+Afo
 wpDbz7wL9aUy2gHYBo726Rfw7BXAiseHUBMS3jNaQs4j/N7jXQTSQpgwxfYy4lofdecR
 cqspTzZbZJWPiJDEOGgCB0sFKf7Ei1BUp/ovDQBlkm0tG2tFjw+pvxdpzQvMX4P1w3Ya
 ZjA+XzwmIzawtcCJOUxzLC/OZ2o+NLXICiZFsgsgElRipK+dVPRRKimfoHcaP1ub7W1n
 Si9g==
X-Gm-Message-State: APjAAAXypb4MCnUU0eZcg/LXsCPCSH7hQeMfe7lBNneVKycL5wWIImZu
 ceyKgIboryjz3m8Mn1IiXwvpWLFRjcyd615WxS4=
X-Google-Smtp-Source: APXvYqzTi4qquj7OmlvYOg2myEZ6aId7IpEInhvdySDJtzKXSiQr5zVib3yXSGtTUawov380F+pHCxVj892XOBAGFtY=
X-Received: by 2002:aca:3545:: with SMTP id c66mr167035oia.129.1558981184670; 
 Mon, 27 May 2019 11:19:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190527132200.17377-1-narmstrong@baylibre.com>
 <20190527132200.17377-5-narmstrong@baylibre.com>
In-Reply-To: <20190527132200.17377-5-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 May 2019 20:19:33 +0200
Message-ID: <CAFBinCDRASWwVoh=vuyqyn5HTHcfa9cXXnMWfpHSbxUAeTAFgg@mail.gmail.com>
Subject: Re: [PATCH 04/10] arm64: dts: meson-gxbb-wetek: enable bluetooth
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_111945_570236_5A287C95 
X-CRM114-Status: UNSURE (   9.33  )
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
Cc: khilman@baylibre.com, Christian Hewitt <christianshewitt@gmail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 27, 2019 at 3:23 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> From: Christian Hewitt <christianshewitt@gmail.com>
>
> This enables Bluetooth support for the following models:
>
> AP6335 in the WeTek Hub rev1 - BCM4335C0.hcd
> AP6255 in the WeTek Hub rev2 - BCM4345C0.hcd
> AP6330 in the WeTek Play 2 - BCM4330B1.hcd
>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
I don't have any of these boards nor the schematics but the
shutdown-gpio matches with the reference board Bluetooth GPIO and the
rest looks fine, so:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
