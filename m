Return-Path: <SRS0=twEQ=DJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B347C4363D
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 14:16:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11593206A5
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 14:16:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fy/miz52";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AUSpHf8P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11593206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+Z74HrXlvKvXVj8vj52EOn3Vtoc3VwTKjpNu8dcyu9g=; b=Fy/miz52PKKGuRHsa+vyfWUw/g
	NIDaWaHtYi+fOgUcbrSu5KvLXQugJmqk7YfvENdcS6h4I3qupr7Afd7F7Yh2o/0aKDnW2Shc5Dv4n
	8iC9MLpEJRYYbhgSHq5e4nO88rM0/TfOS4SfQA1TRts4tyqJ+3CPh0LYD6jkqaCcEmB07Yh7dMSec
	ebBPNEoNt5scoLLp9HTJ2s2V0XjOV6BQsFaJaITDkeF/1EcIVwKfLzAKL2sJsRDaHhEvudTv3TTs2
	lSK8X/6mbdaHPwgzzFnVpylPpTCXsNcbFL/9rXsKfUSUZEVXUFgJRJB7/k8jG2WX/5cGt96by74KC
	AWlSX7tA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOLrJ-0007Sr-6T; Fri, 02 Oct 2020 14:16:29 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOLrF-0007Ro-Hi; Fri, 02 Oct 2020 14:16:26 +0000
Received: by mail-wm1-x344.google.com with SMTP id e2so1935155wme.1;
 Fri, 02 Oct 2020 07:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Y59AvHknuZ7JPu5M+VZVtPAwMMTkQJ0YRDyu3cqZUqo=;
 b=AUSpHf8PfXj7qpN1VSy7IQFUfcXcQ4bnW+llmPBaBPVSwZe8klVXC4dS7JcR2++scQ
 0QL/9SLK8kts8mzJC0Hg+/5JL1K8jbHDa8GvHfst66H2MpGFVQAvHcbQHHbhv5JyYADg
 DRXq6oorUadJDHdG6TYnR3xFleF27f1+QhgxYNf7MP9OA/mQsu1gUjCU2lMBgaPnk0UA
 aL/jaBIzzqRXTKAE8T2ezUzKnHEigWzN5SOP1FPWZY1vlQfP1O+i/NAmeRq+YtqkguIW
 a5YhP66+59PDXiaGvzDFRcVwtoF32YL82H7qm8PgkYKE6w/Uk9I61lQL9AVqQfoRunbQ
 5YVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Y59AvHknuZ7JPu5M+VZVtPAwMMTkQJ0YRDyu3cqZUqo=;
 b=oI3tNlS8qkSAwYvDLP3+JJUsbKxCfY3ZiF2uBgQXoIkV4QHsqMzL2ivMyH15fFCKgR
 h10hv7CoVDhejmLQwJtxozQ36nUwFHSxVUikVKyQ8Y6Xmk8Xv1m7IWH+MTEGyLxpI4DG
 Y67+GZngh1y6GTgZt4aWMvqGQpsYVuIviKAkUgvMXi1jvun3IDjLxdmx4wQWn0n9lfOp
 T5zxqBg7ubWg2bdX01MDWPIO307LHBexEdW4+NP8amEEQC1RUwzHVPbNXQABKe4J6mt1
 seWYVhHgADFNVoihBPtFc0aWSFka9TGJ3IjYmIsegYoveGkUeRJ8HW9RoX133I/ca4jN
 l2IA==
X-Gm-Message-State: AOAM530m9SYec8DGFYQV4hmMAcrtPlWBmNMhnah/g0ZqqHMtaEyHO/Y2
 Zg/0i1TOGFaiSNWSHHjWYeQ=
X-Google-Smtp-Source: ABdhPJz1OABUr8GbX4Yxk3rwgQihoo4Blr4FsZ/1vOIH+3RtopswaIYecRlbTnanlx/u4SV1WdpAJA==
X-Received: by 2002:a1c:c28a:: with SMTP id s132mr3338419wmf.13.1601648183304; 
 Fri, 02 Oct 2020 07:16:23 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id j14sm2045755wrr.66.2020.10.02.07.16.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 07:16:22 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: meson: add SM1 soundcard name to VIM3L
Date: Fri,  2 Oct 2020 14:16:19 +0000
Message-Id: <20201002141619.14387-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_101625_590498_C60580CE 
X-CRM114-Status: GOOD (  12.16  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VIM3L now inherits the sound node from the VIM3 common dtsi but is
an SM1 device, so label it as such, and stop users blaming future
support issues on the distro/app "wrongly detecting" their device.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
index 4b517ca72059..f46f0ecc37ec 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
@@ -32,6 +32,10 @@
 		regulator-boot-on;
 		regulator-always-on;
 	};
+
+	sound {
+		model = "SM1-KHADAS-VIM3L";
+	};
 };
 
 &cpu0 {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
