Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3117CC35FFC
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Mar 2025 20:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jcxSGzchAlZ9+qjhfbVD3FciLjq3tki/3iZkynInUOk=; b=lViRPzObu86TxK
	BxKaqfPMCIOL/b7ebMahMhFq3yhT9xs/La4E/c7FqVj/ZMl/niULBVxQ8g6qB96YX/xEgQZgpMxsl
	nc3Qc5BdVd53PuYovlJLGNdjN351EX++eo5etEpPFpeGoElaI03gOJVa1IMAgt76KalDNDqtcbXX7
	eb9769d5w0oZo12A3L5PhLkj3LQ6MjiJ2XKFAPM4FOyvpofJ3RnIbzdcu3mvrneUB1JnwkCA8ddla
	N/3HGWgkZK8ANjWBVgFv8FEVLNJ21DRBLEs/RwubXt/Wbsg8wlMo1qPg84VLtDi3fesqF0b49uAZn
	29hDw1sKY5XGRuXjEqsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tw5ef-00000000Ip0-1zAr;
	Sat, 22 Mar 2025 20:41:17 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tw5ec-00000000Iog-2pQG
	for linux-amlogic@lists.infradead.org;
	Sat, 22 Mar 2025 20:41:16 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-30bd11bfec6so34020771fa.0
        for <linux-amlogic@lists.infradead.org>; Sat, 22 Mar 2025 13:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742676072; x=1743280872; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FUewnhPveYbMp0RQIUPWHuOlIZ+ySSlnCxxoPsJrsKM=;
        b=dKOyBZQ81HvnwZaNxKVdCS3HdODLewtsItw6ePQ/RoCjRQolnIwyB6bJ28Ggtk7Hdx
         yWcgdvc8BBnJ6u1KwxILf7/ZK4fI7yCL8U1y2XbAj96NfP6W2eYJIsuRoqOnunnhf+qr
         KVyrMlI30g70R7vHrfJBwvyYoN4A2NMOvWr7cVJYdX888qrE5tXJA9m4BKGbB/Y+0wHQ
         TA4j5nj+kQKKBJLRK9J3W6vihbDJ6ZkGtpYhMCCunFUz/oeH8c5Z8+zCCUwMpBFeTnpy
         12ObsqpkuJrhEEfjpRzQ0UndHL7/TGzi5z8QGIVn8JpGgInm86Oh9gnUWRLal/lvgmFA
         GFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742676072; x=1743280872;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FUewnhPveYbMp0RQIUPWHuOlIZ+ySSlnCxxoPsJrsKM=;
        b=vkcOl4XbYUGTiJN+MdsiwuAkSd1wfRf3N68L4N/2ejb6dwTm/ml623bsvNQ2wguMEc
         nIrrY6hkEew0cxykUnUd+MqOwwFEQbhQclD91UNl9eI6hU/GbBZ0AGjO3RkKY3jrMeyJ
         dgH8byIyO54LS8IDt23V13IyOjWoRJaj+qthYE6fUqqRs9Xcl+1G4lmxU2w2G+sQrXpw
         iL6JZAwrMKJugAE7DH1oWIh7T5YoFcrofIOvx8/YywEXWGzE/sKfBHHyzt0fDk9WODz/
         FOKnGmttvMKEifg0omq8RFZ9A8XJGgdI93Oso0cgQ6s2fGdRGdLtpexe26ifeCINt++/
         476w==
X-Gm-Message-State: AOJu0YyfIH+E+g+y+07C8WYUNPrFVdZ5UlnvgnkflZHYGfmN/XPwTozE
	0TSd99D2EAvinOlO3w4bEgnKT63Wtku10mbEFl92yFbqeHqcBOdSTdemi1f+vhBxYgNbiN+M/2+
	qDiI=
X-Gm-Gg: ASbGncvAIA4xE9qOE9e7ubAItRO6su+7pYZFhK+7NNFmkE/HXkvjK1/Z1UfQeSwKoJI
	3XPJ2rqd+qonJOWWqvIfrrtKPjy0Y6kBRuyeK4Hz52E1yEKwlNHklfaG62Ll/KB77fFBgPe70Op
	Cir9pKkJhWGe8rr+wC91H0HshXBqgcLm/jVKbC4sO3j57Td/RjE5kDXMXkyUeGxNuS5y6BW8Lii
	7rS697dgf95dWzfYuaSemQGF8eA+9q0A7nhLvB4UzsFm4ZzsGhvscc35AfxNbe7C79+SXdU1Z3Q
	G3L4y8N4TTsWXp0YH3tvoJA1er8QCCIzEKUPLelvIH5KSEM+Fz0VGfo=
X-Google-Smtp-Source: AGHT+IFWulKmrt/Fawx5d9lDfj0JEWXAuETvklOC2nGphGq7Aqxzo72C0qq9xY5yapTClxN+c+1eWg==
X-Received: by 2002:a05:651c:150a:b0:30b:c96a:775 with SMTP id 38308e7fff4ca-30d7e2225bamr26429521fa.14.1742676072078;
        Sat, 22 Mar 2025 13:41:12 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d7c1ab2sm6849771fa.11.2025.03.22.13.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 13:41:11 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 22 Mar 2025 21:41:07 +0100
Subject: [PATCH] pinctrl: amlogic-a4: Drop surplus semicolon
MIME-Version: 1.0
Message-Id: <20250322-fix-amlogic-a4-v1-1-bd5ccf9ca1bb@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGIg32cC/x2MQQqAIBAAvyJ7bsE299JXooPYZgtloRBB+Pek4
 8DMvFAkqxQYzQtZbi16pgZ9ZyBsPkVBXRoDWWI7EOGqD/pjP6MG9A6ZvWXpnaWFoUVXlmb8w2m
 u9QPddXKRYAAAAA==
X-Change-ID: 20250322-fix-amlogic-a4-55a05e1402d5
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_134114_720312_701299AC 
X-CRM114-Status: GOOD (  10.30  )
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

The kernel bots complain about untidy code found using
coccinelle, fix it up.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503212354.Hx2qaDRe-lkp@intel.com/
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index 35d5540b8eaa2378197d7791ef2470ca6591f693..ee7bbc72f9b36c0c6d5bec76780711f9db3c155d 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -856,7 +856,7 @@ static void init_bank_register_bit(struct aml_pinctrl *info,
 				break;
 			}
 		}
-	};
+	}
 
 	if (def_offs) {
 		for (i = 0; i < AML_NUM_REG; i++) {

---
base-commit: 693c9ecd832669c55e8d8067eba064440d9a4709
change-id: 20250322-fix-amlogic-a4-55a05e1402d5

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
