Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A5AC43217
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Dec 2022 10:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2YjhlPxCssNpz9iO9C5ZmXzZeoyTd9ClSAe4a/7oAZU=; b=OJmDuvb0iJeHyb
	KMccijcQMbFIbL6VOobPqHJhuWIzif4XZvYtvLQZ5WdqgXKharzzZM29vMHmL3u9FdKK5GbCWifJt
	aFhuzM+57kpJZ17fSQICSvLJbsSncSE9nH5qu3fZrve7/Sm0Ir4f/tzT9IR6JrTUxjY4k6McCe46W
	8scoYxLI5l9J5utvc6qeU/d1wrKRG/17uQmp8yFH0I411Toaay0+NjJ2geexn2Fkj93HFJeTBjKgW
	a35BqvvnMtrtGj788TPg/kPx1NVRY24abDofehALoP0n/0gAMFhuRN+ZJJHvALDtjEPjyuVz3rRIT
	ZwbY0tRzC743LfDUZUig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0gqm-006j6V-Fw; Thu, 01 Dec 2022 10:31:28 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0gqK-006iqo-LZ; Thu, 01 Dec 2022 10:31:01 +0000
Received: by mail-ej1-x634.google.com with SMTP id gu23so3083874ejb.10;
        Thu, 01 Dec 2022 02:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IIHeFovEuwjGuythdoubrFT/SXANkAJoc/lUtd9ZW10=;
        b=hApD77a5zfBe5o/b53t+6gn9V8ZyjpGnCPRoe5Id1ypg4cyDfhXbyTUgeWaWip6xQe
         ny0buVuVbIazaDDKYvph3+bQBQdXjdOoT/Bkbi1jqv9ATA/2NFRxdjydRWczM3S3M0C6
         F2PO+ye5Jj5VxURs41Ip0So0q5BWqvc6IL2G5hLtWo4lQQvn66h5WHsJ77DkL8jZ1805
         Z9N7fw8CMXjuhNogHKtg8opMaH+gr4EFjeGfxiEH7gMK0Svj0fo9wnnex+AOOp1hUxwv
         3YTW/aT32G/hUtOZF6SlURhD637ZQETa9HcDK9L3t85XLUFlXRdCweD7uLZg/zJcqgEd
         wDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IIHeFovEuwjGuythdoubrFT/SXANkAJoc/lUtd9ZW10=;
        b=Cpz3t15hIYkza/xTV4xXEhX0gd7KSCc4fyJXK7gYRFRCzHUDJ7N9fWJYqEoEsUORYA
         EQ2I0/mUQJ5sHUUWIiKtFMgtB7EFqX6pzt2PMEJcDVIZF5A66ryET0CofhymP+NC5was
         cJP7ifLQLRTfsrP+5iMyBb/vcktFlHBgNznkhWdXNwG5sZRgYorQvSUgDOHp4W8C59CJ
         tvF4gzCR/Ut5Q+Lyk1TpA7X3vhQdhk/kyCYeksR2mdeE0LiIK9jzlyruu7k4tOd7hg6U
         GOVmuffySeTcP4DP2Ko/4JIAKZCOXkKgBvQi4oGtF+dfNgAeWUhHcldBhhzLqwuBbC9w
         PBSw==
X-Gm-Message-State: ANoB5pmnHTGKmx0NlJsnmtQ7rrTEfVbUqHDCTBmPEjD+HbJWdaXLmz+P
	RkGje1LGizoumPtPGZwJ8qE=
X-Google-Smtp-Source: AA0mqf5bobEV7idrIfWAF3puiMHvXHwes6lSDep2bUEG0MxsOcJSRPbn6WpLKgj9Ih/p31j9JEkJcA==
X-Received: by 2002:a17:906:4756:b0:7b8:6a66:4b7c with SMTP id j22-20020a170906475600b007b86a664b7cmr37811689ejs.663.1669890657532;
        Thu, 01 Dec 2022 02:30:57 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
        by smtp.gmail.com with ESMTPSA id g1-20020a17090604c100b007c07b23a79bsm1592400eja.213.2022.12.01.02.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 02:30:57 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: 
Cc: italonicola@collabora.com,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 2/7] dt-bindings: power: Add G12A NNA power domain
Date: Thu,  1 Dec 2022 11:30:18 +0100
Message-Id: <20221201103026.53234-3-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201103026.53234-1-tomeu.vizoso@collabora.com>
References: <20221201103026.53234-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_023100_729137_441389F9 
X-CRM114-Status: UNSURE (   8.10  )
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

Add define for the NNA power domain for the NPU in the G12A.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 include/dt-bindings/power/meson-g12a-power.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/power/meson-g12a-power.h b/include/dt-bindings/power/meson-g12a-power.h
index bb5e67a842de..93b03bdd60b7 100644
--- a/include/dt-bindings/power/meson-g12a-power.h
+++ b/include/dt-bindings/power/meson-g12a-power.h
@@ -9,5 +9,6 @@
 
 #define PWRC_G12A_VPU_ID		0
 #define PWRC_G12A_ETH_ID		1
+#define PWRC_G12A_NNA_ID		2
 
 #endif
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
