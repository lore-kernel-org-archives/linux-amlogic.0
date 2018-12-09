Return-Path: <SRS0=RQ4l=OS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AB9BC67838
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Dec 2018 19:02:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EE482081C
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Dec 2018 19:02:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pBti5Za7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="CHw6CpTP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EE482081C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QME+mhhzka/X4NyKsLJGnEdqXrjVOQjQXtk0ZOzvgGg=; b=pBti5Za7V9Gnd5
	UUqHuzgjf8SiRaGNrvN5HaP/KX0yiHMmWas0B4j4EuwYrhUsCYWxd4bZorqX+cXiZtpssgzTG38+M
	/5A21UkpeFSCDFoPxE+bJ8ojZqeWrLHZ5mOkSPcrKfXpuS7tx6s3yyUvrsptea1MvjrACidgCxu7o
	obNQcm24N/GzF0JuBZKUNwQFul6YTE2Nz6nDESjTv84i2E98oBrCz2TMAVrgJyEHYpixA22GCTOyo
	xFlNKcMA+VCKDQzVQtr6wrZUxV/jUgSb2LuzjDVqu3wix4QvdvxTdxrMOZxRTBz18DIYd5jnqELzq
	8Bfv6fG05D5fmg3r6KrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gW4L5-0006V8-PK; Sun, 09 Dec 2018 19:02:03 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gW4L2-0006SS-NZ
 for linux-amlogic@lists.infradead.org; Sun, 09 Dec 2018 19:02:02 +0000
Received: by mail-wm1-x341.google.com with SMTP id a18so9114921wmj.1
 for <linux-amlogic@lists.infradead.org>; Sun, 09 Dec 2018 11:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OKSka/+/cVpRHh/4vbzTPbz+qQ+/vVf1kkbTmUZ6zvo=;
 b=CHw6CpTPHF19FzbrESn/kQOq6RBZjBX2S9LWGTvd4Jy5/8hOTLvK5HaSUSsTjyX1xs
 LGrSGfuk+YX1siefrZpEO2MfetpTNMBJPehrBu1bYDwZk6z7xwYUAwJpXYhqIFYXycZ2
 mfp5AmwylQj3T79OqV0CnFOGUrte4hj3bZCwmJ4TUren8ZJEeIWaD3JVr0UFENi74RtA
 28bdnI92HVtRQCuAoYYWN2r9D9dbuxJHM5Ca4uwhxwiGRhjT+RsBdIXFBn3GW/fXz8eQ
 Si9R+aUBbSZdgu+jIvtCMfGJ53rIeSF7CzDuNBxg0I5a1IE4pWpHFPSC3MsEi8gfLWHe
 Ak+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OKSka/+/cVpRHh/4vbzTPbz+qQ+/vVf1kkbTmUZ6zvo=;
 b=RwlPuLoSnhT+b4nushyMxBNNLM6I27jveB42PEbj00WqqoZue46q++Avw5Fi0yNaFT
 N7YiZ5oGQGknR00vk4G6vRVmiHc05h4Q3GTlgdKyyr5GeAZBkdu3LFb4oQwkKUEWzcqv
 KKagGhcuGuStJTjmFa8HGWl8CyOYEuhYHgerJ2Q2L2HpV4Ql4riMtNr4qz0EhvhOL15W
 ax6lCbjuToLOtKQYwiUUixMRgCVfIEmov1lJ0rfNh+OY5wvzJqzxs215I0xamF+DowfT
 pD0qm6E9Q0NniQKb7cNG2NHAzq2V/B7SWkYiLfFSm8zUtxijMYePajUMQDVzCcdWTBkI
 FaJw==
X-Gm-Message-State: AA+aEWb2aiDnk09+hG5k5RpD/gnfSqSUc0jWlHKk940LwdWBJP6kSHHX
 AQv3hQv24jxlUl5l/dol0Rg=
X-Google-Smtp-Source: AFSGD/X8xBh/cgoJxf6cXn7CZH//Zs45FpKW5F/aGAR9KTjB9/fJPP0PAoWaL249Vj1v8NrGS3Z1TQ==
X-Received: by 2002:a1c:c64e:: with SMTP id w75mr8724696wmf.46.1544382106224; 
 Sun, 09 Dec 2018 11:01:46 -0800 (PST)
Received: from blackbox.darklights.net
 (p200300DCD73FBA00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:dc:d73f:ba00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id
 l197sm30560215wma.44.2018.12.09.11.01.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 09 Dec 2018 11:01:45 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-usb@vger.kernel.org, hminas@synopsys.com, gregkh@linuxfoundation.org
Subject: [PATCH 1/1] usb: dwc2: disable power_down on Amlogic devices
Date: Sun,  9 Dec 2018 20:01:29 +0100
Message-Id: <20181209190129.11870-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181209190129.11870-1-martin.blumenstingl@googlemail.com>
References: <20181209190129.11870-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181209_110200_764867_C05AD813 
X-CRM114-Status: GOOD (  13.53  )
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
Cc: Arthur.Petrosyan@synopsys.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 christianshewitt@gmail.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Disable power_down by setting the parameter to
DWC2_POWER_DOWN_PARAM_NONE. This fixes a problem on various Amlogic
Meson SoCs where USB devices are only recognized when plugged in before
booting Linux. A hot-plugged USB device was not detected even though the
device got power (my USB thumb drive for example has an LED which lit
up).

A similar fix was implemented for Rockchip SoCs in commit c216765d3a1def
("usb: dwc2: disable power_down on rockchip devices"). That commit
suggests that a change in the dwc2 driver is the cause because the
default value for the "hibernate" parameter (which then got renamed to
"power_down" to support other modes) was changed in the v4.17 merge
window with:
commit 6d23ee9caa6790 ("Merge tag 'usb-for-v4.17' of git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb into usb-testing").

Cc: <stable@vger.kernel.org> # 4.19
Suggested-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/usb/dwc2/params.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 7c1b6938f212..38c813b1d203 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -111,6 +111,7 @@ static void dwc2_set_amlogic_params(struct dwc2_hsotg *hsotg)
 	p->phy_type = DWC2_PHY_TYPE_PARAM_UTMI;
 	p->ahbcfg = GAHBCFG_HBSTLEN_INCR8 <<
 		GAHBCFG_HBSTLEN_SHIFT;
+	p->power_down = DWC2_POWER_DOWN_PARAM_NONE;
 }
 
 static void dwc2_set_amcc_params(struct dwc2_hsotg *hsotg)
-- 
2.19.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
