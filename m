Return-Path: <SRS0=Bjr1=6C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D54C2BA19
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Apr 2020 21:42:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9F1221927
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Apr 2020 21:42:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sNLpDk13";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZVUggX0x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9F1221927
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k9dVyh6wHIWEkkLnIaLTEZyQYjrCOZy2LgsN4tSbdHM=; b=sNLpDk13hIc/TU
	tYur4KtfSrfq1y+FCPIT1RtURtPH0Q5QDGu5JaNDjHx6ErIwQOnA5TQYGfZ+rOz9qokDzqflTyIbu
	zcQSglYSIns+/weCr24QvFf7jcCif7Npsl30h06k/qRk8OBDKMp7Hf/3nqSdpLfmydkkdOcop+fqr
	AGn18cbCMtl/d53bxaU2GqfdQPtJBci3kix8P9Ca6MtgTRbfR6F6zI91nUqBVUZmMHCzvbiSvF7e1
	MD+qa59H7KSxQDLYJ55303LJhPIe6TBabR9M+Ehp2rhmQ+78MD84440+ynDT+PJOsG1uGhfDsuaXm
	g3MVaUzq4McuBvDbJnRQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPvEN-0004HV-A6; Sat, 18 Apr 2020 21:42:31 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPvEK-0004H4-78; Sat, 18 Apr 2020 21:42:29 +0000
Received: by mail-qt1-x842.google.com with SMTP id o10so5318632qtr.6;
 Sat, 18 Apr 2020 14:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=w/47EmjUE3OUhd2M0nQ4aXQ8hyh3Kb7PGgRqxtZ7DE0=;
 b=ZVUggX0x5rhoXJFUBIldk0DtR/0RR5CPGISHzpnQ+TQnYKrfeMt/KhQQ6q8bIhavOj
 zS5q0fnSx2Qee65hTc8gbTJ22xqcr+E296piNk9oudT07Nb82xX0hBs724JULPmy2x4q
 GJJwWJcNpbmjPbYl1I3v7RhZl331/lkk1TY7969iA0lNpVOYq6SKDsqasccvZ9MjMB4i
 0kUKFWtdXOtUj+1L/TOQnaMqL4x10dyz57zTQnjSaLraneT0/j3K6BnGGG1Pq/Avekeu
 NGM/J24mt5TYyVDDqTHVsWWj/2lHkGdr1t9WzV7e2IJ+pq+90XlqbWTaYHg99pIxSELt
 5wwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=w/47EmjUE3OUhd2M0nQ4aXQ8hyh3Kb7PGgRqxtZ7DE0=;
 b=LzUnFkFEjTC4XOXF1Fvgjsb5sAXHM8DBcbYqPzsF87I6VOykEU60j7JQlUZ93V9WdN
 +9QYt+0mktVzPdI0hGeHfE/Y73JB7+Mb32/fZEgIlN/xJCED4GOlJ+t/141nQqP51nGY
 TcFi3/5tziQlYEv/N7GNpogxoaySd/Qy26c+D/osIiR9h3f5TS0tLQLfI9PU+8B7ctrd
 285omaopFuKWC/AwIMnYpex3q7qdrmR4XjIq6Io7vBX+ya3KWfIhe2JYTHyJ/C/JD39X
 ZS1n11pyEJwbj0KRWgCmMj+h4ZlC6v10E/Ep4MG1yq98wdZOS7idCYOc+/RTqgKkWV3S
 uPhA==
X-Gm-Message-State: AGi0Pua5FO3wC3fob/hFE/9HzbDbEi+umaoXsjPIWpze5I0fDFz+MMK9
 arzf5vV9KdFKXx8s4MT27pg=
X-Google-Smtp-Source: APiQypK/ZNb28CwxyoAZvAhkzL57dtO3+k9ZptxS3i9hczv3oFx6wdSujk2rkeT1CVCQDJTCIa6JzA==
X-Received: by 2002:ac8:1904:: with SMTP id t4mr9678039qtj.367.1587246146742; 
 Sat, 18 Apr 2020 14:42:26 -0700 (PDT)
Received: from imac (dhcp-108-168-12-59.cable.user.start.ca. [108.168.12.59])
 by smtp.gmail.com with ESMTPSA id
 p31sm18381085qtf.11.2020.04.18.14.42.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 18 Apr 2020 14:42:26 -0700 (PDT)
Date: Sat, 18 Apr 2020 17:42:23 -0400
From: Tim Lewis <elatllat@gmail.com>
To: elatllat@gmail.com
Subject: [v2] arm64: dts: meson: odroid-n2: extend cpu opp-points
Message-ID: <20200418214223.GA4484@imac>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200418_144228_286880_02DB0965 
X-CRM114-Status: UNSURE (   7.63  )
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

Odroid N2 has a large heatsink and HardKernel supports overclock
through the addition to extra opp points in their official kernel
sources [1]. Add these to the N2 dts only, as other S922X devices
may not have suitable heatsinks.

[1] https://github.com/hardkernel/linux/commit/f86cd9487c7483b2a05f448b9ebacf6bd5a2ad2f
Signed-off-by: Tim Lewis <elatllat@gmail.com>

---
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index 42f154057..6f32ac83f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
@@ -260,6 +260,25 @@
 			};
 		};
 	};
+
+	cpu_opp_table_0: opp-table-0 {
+		opp-1992000000 {
+			opp-hz = /bits/ 64 <1992000000>;
+			opp-microvolt = <1001000>;
+		};
+	};
+
+	cpub_opp_table_1: opp-table-1 {
+		opp-1800000000 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-microvolt = <981000>;
+		};
+
+		opp-1908000000 {
+			opp-hz = /bits/ 64 <1908000000>;
+			opp-microvolt = <1022000>;
+		};
+	};
 };
 
 &arb {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
