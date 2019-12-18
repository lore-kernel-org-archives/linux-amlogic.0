Return-Path: <SRS0=A4ao=2I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE04CC43603
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 14:26:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C04CE218AC
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 14:26:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JDVBV9Ek";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="0MiYbdrQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C04CE218AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Baek+IwqtgXGao1k6hA/cUD2BrnfELTysFV2F7rws0Q=; b=JDVBV9EkEEJcE0
	MmEJoIBAYBH/GbqauxRtFS8hR+gK5XP9AbSdAZ98mv97SNBOdKhQLICsQQ/S/G8BOTHRBOOt2l0WY
	z9QZ31tlqO+7FLyVm280FumjN/hCn3XRx3FBRFP95SobWFT9eRxUjwuoSBwRomRwI2p1xXg+RGaIZ
	ITJkRjAfMLshtujqJ13Yr8Xz6pNIMuLm3io+c9pOZcRvhGVWuNPKrWBGuBpHPgFswnhPBfdA5CJV0
	BSgZHq8QgriCa8K/+79d1ogm8Bg2mc9unxbyFx1mcCRfzoxYXpxfBVZFtNbGT9uMo5zbi6B/36sn5
	rNLfdnrzc5iYbUNUO8Cg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihaHj-0003S2-IA; Wed, 18 Dec 2019 14:26:43 +0000
Received: from mx07-00178001.pphosted.com ([62.209.51.94])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihaHP-00037y-Ba; Wed, 18 Dec 2019 14:26:24 +0000
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBIEOMfW015469; Wed, 18 Dec 2019 15:26:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=w4HnMszGdzKynqPVMRC5qZxWn0UBjfQfixyAUj2Vbxw=;
 b=0MiYbdrQcmoCziaitsKGOXGZ4rzbtB85PBP93V11bXTgdMBcrKGUNTKZuK3lA/RgSXys
 hx4oDI3WkBdJhCjDB08H/V+wXy/ZyWpEoRPEW+D0TNhzJWihKXCl3L9pZllLT3KQgbpo
 gS2L5dQf+IdZfG60sRRzy99aB/U5OZZrDLMr52JhKPSdfNCfKWADQ+7Rs1ZlziTojgJ+
 i4Z6xIvnwvAmPMEso2osaD9tFLa/V5ZUkHEUqPmohr3I16h5qV5LRGJmpAHp/l4eljSv
 cyDAeU+3VO9/LwGyp+jq0na/Y+uXpbWTo1rcQyRrXWRzhjY68M+Ehab3W/H3hhiiWHA1 CQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wvp374vcg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2019 15:26:15 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3982910003B;
 Wed, 18 Dec 2019 15:26:15 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2691F2BEAF1;
 Wed, 18 Dec 2019 15:26:15 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 18 Dec 2019 15:26:14
 +0100
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <khilman@baylibre.com>
Subject: [PATCH] dt-bindings: usb: amlogic,
 meson-g12a-usb-ctrl: fix clock names
Date: Wed, 18 Dec 2019 15:26:13 +0100
Message-ID: <20191218142613.13683-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-18_04:2019-12-17,2019-12-18 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_062623_732554_FDFB1B99 
X-CRM114-Status: GOOD (  12.18  )
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
Cc: devicetree@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

dwc2 bindings require clock-names to be "otg".
Fix the example in amlogic,meson-g12a-usb-ctrl to follow this requirement.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
index 4efb77b653ab..267fce165994 100644
--- a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
+++ b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
@@ -107,7 +107,7 @@ examples:
               reg = <0xff400000 0x40000>;
               interrupts = <31>;
               clocks = <&clkc_usb1>;
-              clock-names = "ddr";
+              clock-names = "otg";
               phys = <&usb2_phy1>;
               dr_mode = "peripheral";
               g-rx-fifo-size = <192>;
-- 
2.15.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
