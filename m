Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DB7C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jan 2022 14:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:To:From:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ILLrMFxEEoqdxTSk6pe2CKoSDjTeYt1peI7+wlRiiWw=; b=T0P
	mpefLEGxge7gvM2qXm2esCFtb2bwi3VkHBzbaCl7ULPFUkJTUSGiXw9A1b8HfdcTwANpqd5H8B/r8
	bNYFkRy1QcYGz3j710aW1Z4cY96kkUf+VKbm/Mw5RKfYFbhduONUOEWoecKdRAHeOWc3Gf3psL2hc
	2hYjA/e2lntmK0vvgjymLNGIgF+F0Ua+PRKKbJkbC9uW2F6LkWUyszQEHnjT/Ckv+YKAZ8/ACFYcG
	L6B8KQSfdE0JcFLErvOFJWNzttgf5c6zC9WSzKtEkykdHUOMxrlgkbE5RJtfgnA1Ink4yEdk3OMjV
	RwR53uPOggarpsxDQ0mg5+fakW+d1zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n81Da-006G5g-Bo; Thu, 13 Jan 2022 14:36:46 +0000
Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n81DX-006G52-2d
 for linux-amlogic@lists.infradead.org; Thu, 13 Jan 2022 14:36:45 +0000
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 363275C0B80;
 Thu, 13 Jan 2022 15:36:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1642084598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=5n71jSuoFLuEKrBHezy69s2vTc49LY/8zOhitBWkCgw=;
 b=JHP9uwLLxU2tkBUC5EGVPSx2ysRA7JShnh0Xf/uHj+GYg+soSp/SlK2+Fw4MUIyMm3X7cf
 FnnB74Gd2lckJSdOQc/DR8UbfZIVuN/1dEdVN7mh9bIVeBnE2VsBRWg8y46mDIw8F1XUs0
 r9m3mg8TF/LTL6NWuhUDfQUkTwJmQ6Y=
MIME-Version: 1.0
Date: Thu, 13 Jan 2022 15:36:38 +0100
From: Stefan Agner <stefan@agner.ch>
To: narmstrong@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: HDMI CEC on ODROID-N2+
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <d2ef8936c54567c9c2652b3c53a82f68@agner.ch>
X-Sender: stefan@agner.ch
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_063643_620893_1690AC9D 
X-CRM114-Status: UNSURE (   7.81  )
X-CRM114-Notice: Please train this message.
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

I am trying to use HDMI CEC on ODROID-N2+ using Linux 5.10.91. However,
I was unsuccessful: As far as I can tell cec-client uses the right
device (I disabled CONFIG_DRM_DW_HDMI_CEC since my kernel is still
missing your patch "drm/meson: dw-hdmi: disable DW-HDMI CEC
sub-driver"). But communication won't work, and dmesg prints timeout
messages:

[   68.831253] cec-meson_g12a_ao_cec: message ff 84 20 00 06 timed out
[   71.134987] cec-meson_g12a_ao_cec: message ff 87 00 15 82 timed out
[   73.438826] cec-meson_g12a_ao_cec: message f0 timed out
[   75.742677] cec-meson_g12a_ao_cec: message f0 timed out
[   78.046555] cec-meson_g12a_ao_cec: message f0 timed out
[   80.350446] cec-meson_g12a_ao_cec: message f0 timed out
[   82.654358] cec-meson_g12a_ao_cec: message 11 timed out
[   84.958285] cec-meson_g12a_ao_cec: message 11 timed out
[   87.262194] cec-meson_g12a_ao_cec: message 11 timed out
[   89.566130] cec-meson_g12a_ao_cec: message 11 timed out

I did a quick test with CoreELEC which uses the 4.9 downstream kernel,
CEC seems to work there. So it does not seem to be my hardware setup.

A quick test with the latest Linux 5.16 shows the same errors.

Do you happen to have an idea? Do you know if HDMI CEC using upstream
kernels worked at one point on that particular platform?

--
Stefan

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
