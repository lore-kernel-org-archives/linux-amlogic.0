Return-Path: <SRS0=11Ec=AH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0329DC433DF
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Jun 2020 11:58:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C02462078D
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Jun 2020 11:58:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hvdNS5SG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LlOfqjWP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="XWkYrvco"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C02462078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3qrnTZ5r3pY7E7yyOrgWYvk65Hrv9YFlS30UmShoNCQ=; b=hvdNS5SGIwllt1gOorEHGA0oBx
	I+8Ss8ZhBsAOkhpQ5CmdyfuvMqSKnr5mJdwBpJZL3BhOj+fi1avOHMdBnMgUT5BpdoAuQ0aJBJj12
	sZc1sz1jsMqA+qYik/yYZ21oslBx08QDwr0zTRX0svMt9V6ALkNoRUzJyvmYGzXDuHbbzfEP4dlZD
	umccTk5L4n07p2yUEmEuEWQ4vFNCdrhwF0VrpcOPyGbnQhKKw6un809stYXzv8uXtK0+bgu/RkW4S
	MCDN4OlRQVosXKq6mRsuLQJzdY+epaihwPXWkRCMNus7k5p2h1G3ZjJ/UnAun3dBDBjhANUP485+1
	su63hTnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jomzt-0000cp-TW; Fri, 26 Jun 2020 11:58:21 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jolPm-0006f7-PY; Fri, 26 Jun 2020 10:16:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=BamqkkKvEHB565X2BcH8GvDc87lmTvMMVkEJNgXnyLc=; b=LlOfqjWPP4Vdk1dApDJc9j+bqM
 dWbN/o/mIWKxDoYnnuNQdiO+RU/xaY0jcM/e/YuFzPKSj7pyJZQF7bRWGfhWFmTZi42iRCpJocbLi
 rek1jTWdIdvPALRSNNWMt2w1bEmeLiIcxM3UsO5vZHahixmr2/urPnxY2exWAq4ZohEBd1w8go5hz
 2av9ZkDn0M/u8tN6UNRtP6RW46FSPchYRmPojueadQBGikQFIdgY+pbNnV1fMdHscAu0IK6F/xc5F
 nLubRPC7VZB6lK6gTZbdhKxjXlqKjyuzGRZKF26VqbOmgtNOvxpf+DC1qfN5FWQlTykpU7ttCUr6n
 zbS3s2vw==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jojNY-0007pi-S8; Fri, 26 Jun 2020 08:06:35 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1742A2076E;
 Fri, 26 Jun 2020 08:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593158791;
 bh=ShdZXhFMHq+oH0B/0iNOVMT1LmutMO+0UPHFutoFfXA=;
 h=From:To:Cc:Subject:Date:From;
 b=XWkYrvco4EvI1xVUDR9MPyhSaOvyF7cF8KvQYIVaZic8SnHEJozzOPcaW73rROW+j
 YewsMYkx+/mvitPgi+Zascw6RwYBVPAB9pPkqgmjSxYDF0zf9EyzKosJfevEwrkuYc
 fn6lfMiKKXutniiEO5vX9g6DCh5eFvxdW6FqJYuU=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: meson: Align L2 cache-controller nodename with
 dtschema
Date: Fri, 26 Jun 2020 10:06:26 +0200
Message-Id: <20200626080626.4080-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200626_090633_221879_A19363D6 
X-CRM114-Status: GOOD (  11.04  )
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
Cc: devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Fix dtschema validator warnings like:
     l2-cache-controller@c4200000: $nodename:0:
         'l2-cache-controller@c4200000' does not match '^(cache-controller|cpu)(@[0-9a-f,]+)*$'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/meson.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
index ae89deaa8c9c..91129dc70d83 100644
--- a/arch/arm/boot/dts/meson.dtsi
+++ b/arch/arm/boot/dts/meson.dtsi
@@ -11,7 +11,7 @@
 	#size-cells = <1>;
 	interrupt-parent = <&gic>;
 
-	L2: l2-cache-controller@c4200000 {
+	L2: cache-controller@c4200000 {
 		compatible = "arm,pl310-cache";
 		reg = <0xc4200000 0x1000>;
 		cache-unified;
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
