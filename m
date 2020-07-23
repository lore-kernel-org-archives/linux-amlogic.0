Return-Path: <SRS0=T680=BC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22F6AC433E1
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Jul 2020 18:41:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E287E20737
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Jul 2020 18:41:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XIcWsr1w";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=telus.net header.i=@telus.net header.b="s4fVuhon"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E287E20737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=telus.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Subject:Message-ID:To:From:Date:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7CdlXgoDc51vnB/ym+7SiJA/HlOkF7o9viQOoz8TaBc=; b=XIcWsr1wOI4VLwyh5D5UJewvAF
	Re1G0dTbbWvl7x1jANOUSmdJW+LTtHMNdu8OI1oYDkLYOopCUZlxD4RiYIpAO4sW1xo954pU1t/Iu
	OdVTXuGvMrve9/59hBlNW90uiNeaDmF9oisPwTPa6YSCEOhePfEEKzU/8vpCudF0hMoQDiRupBMgr
	VPuRAyl511GMBrVmqR1qOR662b8E96bKlbqkm0Sblk7pONJKhZlerw2D0fh90zfS9aEbDCz3sYc+z
	BejmQl1098qfAXeyHvFE1W8Sl2hE7MmrrThkxfXt+/OPM+z8pmxzBAwF2vkZfOCvVZnEXZg3VQw8Y
	GCfwK5Fg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyg9E-0007Fx-Oy; Thu, 23 Jul 2020 18:40:52 +0000
Received: from cmta17.telus.net ([209.171.16.90])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyg9B-0007FQ-V8
 for linux-amlogic@lists.infradead.org; Thu, 23 Jul 2020 18:40:51 +0000
Received: from mtlp000227.email.telus.net ([172.20.100.70]) by cmsmtp with SMTP
 id yg96jK5XgYgvryg96jVX9J; Thu, 23 Jul 2020 12:40:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telus.net; s=neo;
 t=1595529645; bh=GMPhdJPYyCmdzybzekSU7qjns2FcX/+WI3eMuPhVhRY=;
 h=Date:From:To:Subject;
 b=s4fVuhon7KnB8avUhifqzauRn/OiqaF53tSIrGyDZYSmjhoZVWS4QlF85QTnDxy80
 4GJgarIzticA6GHiajz3VwjoeVDssYAYoIdUyQ+hsZQSCTNjoqBPWK4trU1NM2Di+X
 c1MbUIqW67XIZjiXgKIXuK6IDbNSLd8bqjRMMjm24P5QPTYAEEOw00VLWjnWiCPGBY
 K00F+UdEguzyQX4rFnTi8hanYDEHRe+cR14G2H1dZbNskm7GLxL5QGh1SHEfRwCEfL
 ODDv5tWPzItNAsygw192YIFNyaSn2+XADm2Xyc2jArUd+S7+psjO3ZPS8A5/3BFOLV
 F/uNYtB34kKrA==
X-Telus-Authed: none
X-Authority-Analysis: v=2.3 cv=MIQeZ/Rl c=1 sm=1 tr=0
 a=k3HnyVAFRisAcmugAXQHxw==:117 a=FKkrIqjQGGEA:10 a=iq7u4Aseb9EA:10
 a=IkcTkHD0fZMA:10 a=JUPFpYjsghUA:10 a=77d9mIDfZ6i_DQXqtvwA:9 a=QEXdDO2ut3YA:10
Date: Thu, 23 Jul 2020 12:40:44 -0600 (MDT)
From: "honsch@telus.net" <a6b04393@telus.net>
To: linux-amlogic@lists.infradead.org
Message-ID: <1356858918.38098893.1595529644632.JavaMail.zimbra@mailid.telus.net>
Subject: GPIO Interrupts
MIME-Version: 1.0
X-Originating-IP: [24.87.216.241]
X-Mailer: Zimbra 8.6.0_GA_1242 (ZimbraWebClient - FF77 (Linux)/8.6.0_GA_1242)
Thread-Topic: GPIO Interrupts
Thread-Index: TEHZTu2+yb3OBXYufc+z+9r6FKZDkQ==
X-CMAE-Envelope: MS4wfO6ZUJ+HUp75WeOleaw4yWb9BQp9UFNnot3twd83l5jt9QwP7PuHabx17ReAzaKaW4+zHCpM8RWYyZTexUBUU+iyJR1O6zyJSaHPSMTjTz3M1QH0Xv1R
 SUHQa4Ueb+nq8VDV/GELt0SjBDt7mlwDxV8WH2CRJoxQdzWnKRTWyTse0kXWytw+xCneoPo5Tjqfshc+Q6FakxcPijabLywQRRc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_144050_096633_D187CB07 
X-CRM114-Status: UNSURE (   4.35  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi there,
I've been working on a ODroid C2 project for a while, (meson, gxbb) and I cannot get gpio interrupts working from the devicetree.

I'm trying to hook up the PPS gpio driver as well as some gpio IIO triggers.  I had it all working on a 4.x kernel a couple of years ago but on the 5.7 it's a no-go.

The pinctrl-meson driver is missing the hook for gpiod_to_irq(), and the irq-meson-gpio driver is missing the activate function for platform_get_irq() to function.

Has either of these paths ever been implemented or tested?  Am I missing something simple?
Thanks.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
