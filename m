Return-Path: <SRS0=3eID=6G=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D1A7C55185
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Apr 2020 23:39:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAF632076E
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Apr 2020 23:39:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gwfmr/UY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oDo/4WF/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAF632076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fcieV2SGyxUk+xiFXe2WQEgqJL21LB440bD69TGk5rM=; b=Gwfmr/UY3rWgKi
	U43L3u355PaEnL+99JydXk/usZEZ5H1dVkPTWSaIBqzTgOkdDGZBy4ck1vhxfvm2hIesCuDl3BKrG
	5wlbveVc9OROL7ucQ/vFCblJlDF2NBUkQVkClLCywrml4LwL6Z2Clc0iE0W4vjbp3eheV2dXgpSlI
	2mMW4yyRc2UjdWZPXjDGxMWc+n7FqmR6THkD0bM5qQfszMEOmL1RaXYZxYarmBneBxLLjHRT/b/v8
	Nztssryn3FbF3Cl+o7W8wl8WpeMPx79XGI6ojc4Y5Fk8nybG0qQvn1krEfbFdG3w6DhEIjRv8jsb+
	D/vVb7iCv/OdvyNHEsqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jROxt-0001N0-6s; Wed, 22 Apr 2020 23:39:37 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jROxq-0001LX-Lp; Wed, 22 Apr 2020 23:39:36 +0000
Received: by mail-qt1-x841.google.com with SMTP id i68so3367883qtb.5;
 Wed, 22 Apr 2020 16:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=E1PBrkT1LoNCkirZimCNKHoVPu32mXxSCEKcm1zSQdY=;
 b=oDo/4WF/ApXIvPS+YZM/b4AuPq4KMtNUrAx4kPRyrKcfDY/7N/wACbuVSV9Bv/+yzf
 fsnHPe6JvdEzXhWLh9tQ6LLzYjBZVEjddVBn1gtQAALZMkA67fSSmIEs97PND8XNvZYp
 /CLble/z+CslEMET1pTe/sVN52S4rwol8nho+e70U31cQydk8ItNbaD2Aun5iR9YbF6y
 S2gA8LYXgnTxOjCa8ODOggGJVmTiCJMrAfqWMBASVIq+rkmiTUfucLWHgc1v7UxPm/SA
 KXTVxF1f1yGF6eVCicEPf0DvQnww0cq8E9wKeCSoC9OtuV2k7GYnhhDWSC8guN4M4SP1
 qKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=E1PBrkT1LoNCkirZimCNKHoVPu32mXxSCEKcm1zSQdY=;
 b=iFyIJMxvrhQCB+WdTfLDSBA5dc/nunplx3JhUgwglcJXl8AVKL8yzzapw1WGabhThH
 tr6rjAyMx9PxxcdLhBqdLa6k6FWHLVi+Xg68UdvSZMrz49GB/1hSJCXEmejbY15SvQh7
 MD0HJPUgzPaQo7XlCmj2GZ3q5oYg+tTePt/0/kPfzfiUIjPE2rpjfl3LBsqTa++QFQ0w
 f12WSIciqxaOAk99LFCUgcSSeJVffFqH62J3w0NYbT1KaQ8oWW7C+1wtY5YA06NLsWWs
 07kuNIYR1Nb8wQ9td0VI9RqAfwoMgYgryjdfqr+JFzSDEqHcl1S+NxOyoefogvcgS6rq
 H6GQ==
X-Gm-Message-State: AGi0PuY5ydE+1mQVB6A4hpOytbb+e4kO5+kdO9XgfzojipXhT1E2pUH9
 +EWWgbfuqJTsDo1Vo+WEuXY=
X-Google-Smtp-Source: APiQypIx5CG1YBGE7PM0vaWxnGyfc8b17Jq+bNco8g/8Tp6x3Az3BOQ4nLnVYoI1NU6hWc+y49zG8Q==
X-Received: by 2002:ac8:1090:: with SMTP id a16mr1262025qtj.181.1587598771607; 
 Wed, 22 Apr 2020 16:39:31 -0700 (PDT)
Received: from imac (dhcp-108-168-12-59.cable.user.start.ca. [108.168.12.59])
 by smtp.gmail.com with ESMTPSA id
 i6sm475709qkk.123.2020.04.22.16.39.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 Apr 2020 16:39:31 -0700 (PDT)
Date: Wed, 22 Apr 2020 19:39:28 -0400
From: Tim Lewis <elatllat@gmail.com>
To: elatllat@gmail.com
Subject: [PATCH v3] arm64: dts: meson: S922X: extend cpu opp-points
Message-ID: <20200422233928.GA2816@imac>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_163934_741743_32D247D1 
X-CRM114-Status: UNSURE (   8.22  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, joy.cho@hardkernel.com,
 narmstrong@baylibre.com, khilman@baylibre.com, christianshewitt@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, tobetter@gmail.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

HardKernel supports overclock through the addition to extra opp points
in their official kernel sources for odroid-n2 [1]. Christian tested
on other S922X devices with "no obvious issues". Neil thinks dvfs and
thermal managementis can keep other S922X devices safe.

[1] https://github.com/hardkernel/linux/commit/f86cd9487c7483b2a05f448b9ebacf6bd5a2ad2f
Tested-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Tim Lewis <elatllat@gmail.com>

---
 arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi | 15 +++++++++++++++
 1 files changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
index 046cc332d..1e5d0ee5d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
@@ -65,6 +65,11 @@
 			opp-hz = /bits/ 64 <1896000000>;
 			opp-microvolt = <981000>;
 		};
+
+		opp-1992000000 {
+			opp-hz = /bits/ 64 <1992000000>;
+			opp-microvolt = <1001000>;
+		};
 	};
 
 	cpub_opp_table_1: opp-table-1 {
@@ -120,5 +125,15 @@
 			opp-hz = /bits/ 64 <1704000000>;
 			opp-microvolt = <891000>;
 		};
+
+		opp-1800000000 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-microvolt = <981000>;
+		};
+
+		opp-1908000000 {
+			opp-hz = /bits/ 64 <1908000000>;
+			opp-microvolt = <1022000>;
+		};
 	};
 };
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
