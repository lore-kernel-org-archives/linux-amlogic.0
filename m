Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27FFCCF9C69
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Sep 2024 17:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Oc5L94ev2TijBqJPQSEoHYG5kP/LVlWAT0gxrWxIwac=; b=c5wnb4hRnhpisA
	U5DKAk+C1+noi1qP0zbDAXP/65GaiHgEN49pJ3W8O7wXDeBw3i5u2ectV7Lalm8CtavArugA3J6eq
	8GGn8DrSr+1ng0hPS14AqZyGiSQzsRPDr1NtMTt89dzKSejO66lsrXW06ja7Df6ezR+n8ovN9miFI
	+oCfEc3oMDQVLy0qZGipgqmBzLH8bTJttt4eraqxQvZ5bB7qKWoVBvj8+tXWSGTbTEB3qF8Qs57GE
	k+yZ2J04o0WTgO38y3BymbWqqQArq9MI+bt08lGTyl+9YWMntIt03Nw9kTWZYPkfgsHaizqToXK1o
	egVnKdfSyiumhQ/IVHgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st9N0-00000002wxf-0iU7;
	Tue, 24 Sep 2024 17:30:38 +0000
Received: from mout.web.de ([212.227.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st9Mx-00000002wx5-0jVz;
	Tue, 24 Sep 2024 17:30:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1727199026; x=1727803826; i=markus.elfring@web.de;
	bh=4mfwioSqNz1uaXMGzI6rNjNw0tbkP090IrnGZupCa+E=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=wf9v91rxSNdGDLLl0AMKUiQ2QTdlc0kreAk4pcwAJEI8/2P1Inb6NVHtJgK3FKRY
	 ZqDpLujR9i5PHPDsjaP5ZzaBBsSQsuAHXHAdeP+bzdAwvDJBOcRH33ZHDZYd3kAD1
	 hjbXBT8y1AnhU8WjbZ6gZRDzA2dSrQqLevk5TBPiyKbIBMI1AmIgL4EUDKyK1eGAw
	 64eeWjZIwKF13bVvFDheeDPk85wKI4IAbvtdPHn+Ncv8aGGVnU0LEyUHG+II3O3jz
	 N/jocAYaqYwcI4On540TNX9NJu7g1tHUD7utwPxoGHikXgSbLKyAUgG5erJ18ZGAN
	 QSYwdkrYrnHhw6NKvQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N6JxT-1rrNal11nV-00u6Yf; Tue, 24
 Sep 2024 19:30:26 +0200
Message-ID: <641ff33c-3687-42d7-933c-484bf3ab595c@web.de>
Date: Tue, 24 Sep 2024 19:30:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Wen Yang <yellowriver2010@hotmail.com>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] soc: amlogic: canvas: Call of_node_put(canvas_node) only once
 in meson_canvas_get()
X-Provags-ID: V03:K1:x907D9MwWHI2ckPDKuTvoYE0b+ZRZLxcbFnLePj3PC5GDLUoMSX
 HAq3QNdlAW+3i9H6I4tKBVcL6YDhd7GIIUQnuCAQKS0beJTnJaR9mOvDpACUzOnikB7xgYt
 Q0WRJ1Ku5YzaUmo1K5sHlLKZpTkYmYqYwn8GPTzxJdtpYZ8uvM30En5LHOoCkFkawFwY2dw
 iVlWGxBMj9diT6t+/SVaQ==
UI-OutboundReport: notjunk:1;M01:P0:XNVQTf+Rhd4=;diLSSIvOa9yn75IMCCgotgIqeDN
 5UqB54P61CPlc4r5ZZALfsxLQ9chaxX+dwTR1WTOAFNXh+y/SUo8ULH6yaourTyWoTcediPiq
 q6MN/SCAsYuBTdX2G47lH16lzp/RQHArzsGrOK66aI5saP2EUAwYYbs0+MBgo3c0GnuYkaEA+
 64Slj4/QB6Pl2Uoj0cWI4ND/14ydb3lPbmbPeM3UHNhxTV9K6TT65cLJMg4ujBZNyiVQCAupX
 tjLA5MlKbGVdjXy+EuQjULmlIZOcyEJQJzkdDCpaBqi6MqsFlL82fJlHK56B2AQi8Dm8VmR8z
 hQwHrWQRTtMWB8QPLzS+a15UXga9t02UlNV6EXtrzmuhe5jc0P7VWIRhqRmenNwcCNxfw/LOS
 fiG+farVjti1/5BjRBjZhAqAXvIBzT3VMiKCRJsHY6FJRQg8noCVn6gjHWwOMHU6H1OH9abZs
 MaJqt+EPVGf8t+2LCoEqmGvUv0KSEy6IobcpxJomIFnxaOG55x9o2esoWRGhlLN0N3j7zBww3
 pJMKVP+9xAlxLnWf+tYDArAqNzY/h8Um7B5FCX8cvcOs9bIJo/Gq6u6T/1WKX4dzop0CVs7Pp
 jbusyx0g7ISGAruO+fW0A6y9S37ZZFZuhEfgPSjlIZtKtbJ0WJX7Psx+aJ5fQUuuxzeFvDObG
 UMJwNGsWOptfJbz48D93wNjLuWXXIY5YadWAX/On+RBueRtnAo51z4HqWVRHWz9x7/J423xw2
 Rz25EUi4WtluiuRGyXmmdbw1CkkCoQwLw6VBmRGN4wxh8JtaPvc+fMPtycWPo/de0SnFliZ4O
 3d0n2XtwJIteF3/+LHFIZHUA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_103035_726116_20FE0017 
X-CRM114-Status: UNSURE (   8.09  )
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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 24 Sep 2024 19:01:58 +0200

An of_node_put(canvas_node) call was immediately used after a pointer check
for a of_find_device_by_node() call in this function implementation.
Thus call such a function only once instead directly before the check.

This issue was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/soc/amlogic/meson-canvas.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/amlogic/meson-canvas.c b/drivers/soc/amlogic/meson-canvas.c
index b6e06c4d2117..245157053ed3 100644
--- a/drivers/soc/amlogic/meson-canvas.c
+++ b/drivers/soc/amlogic/meson-canvas.c
@@ -60,12 +60,9 @@ struct meson_canvas *meson_canvas_get(struct device *dev)
 		return ERR_PTR(-ENODEV);

 	canvas_pdev = of_find_device_by_node(canvas_node);
-	if (!canvas_pdev) {
-		of_node_put(canvas_node);
-		return ERR_PTR(-EPROBE_DEFER);
-	}
-
 	of_node_put(canvas_node);
+	if (!canvas_pdev)
+		return ERR_PTR(-EPROBE_DEFER);

 	/*
 	 * If priv is NULL, it's probably because the canvas hasn't
--
2.46.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
