Return-Path: <SRS0=wfDe=WU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B991DC3A5A4
	for <linux-amlogic@archiver.kernel.org>; Sat, 24 Aug 2019 08:05:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E83421670
	for <linux-amlogic@archiver.kernel.org>; Sat, 24 Aug 2019 08:05:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rcMyzBUH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IRLobxtj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E83421670
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=c/q52I/zMRIcTtwaLAPvg/UV+y2DlKU8CKwhmI9vMh0=; b=rcMyzBUH6RBLFUNK7l1fmcTHTb
	T8ktVSvWjymWjI3TTIbwFfZ00oRnlGTQnmYSLAcsUbIWGezQyyNcV6sAGbq5HLwD9hNyIqsqLrlqN
	5zgenV00ykRQiMKnGz1ff4j59babzAEThJcQCoYCGU2/JmpjISwmRFXBQ6MRqYNWXwbg1PM8+8JYc
	4RloEbDyDTqe5N/W+dnIa11yUW5dGXBIQ0GQbBcQqsFNO+e8qdUvDc8ULQm4nAAiwIYJFGrgf2w+H
	6iCQvircEOxoa1QZoVLzDgoYNTe+gkcajMkg4JaoZhTqE0XcMuRUPqRIIWmMOZOugYr4lX5f1tm9s
	aTzM2NbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1R3Q-0002e6-0c; Sat, 24 Aug 2019 08:05:44 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1R2m-0001JZ-Q6; Sat, 24 Aug 2019 08:05:06 +0000
Received: by mail-wr1-x42e.google.com with SMTP id g17so10612975wrr.5;
 Sat, 24 Aug 2019 01:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8VCD60Jb/+pjJ/5tE2H1gE1kn+YA9VqYcdsUMqOXSco=;
 b=IRLobxtjE94mqtQg5b9qleFlE2Cr+arwKQzrAYp5C/aNxsGM14b/lZ2dMXxVbNthdZ
 RXT0JvYJ6VLojJQ8flXvXLfElikgys4OKbTZ7uCfTrS9kY7qoKCZvKtaDBiwsKuGCXgZ
 UCmQLG8DdYljPqGL/NcbUrObjhNqWcze/M5j/QvB3G9HjGnXsNTFWaVGYPEvW6ruhDzO
 cpXP5zbyqTl4tiNdFoVgtU7ThJt4HFQib+9ANuJCrVSYI5cPC0RTtyPo1TWsNeFbR0LS
 +08sNU1i4ZqzR+v61c9nMlqbsFV6H2487Xkw6JkTNt70sP0QVm496cIipNg531uk7kod
 T6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8VCD60Jb/+pjJ/5tE2H1gE1kn+YA9VqYcdsUMqOXSco=;
 b=RCp6RDbeNwM6Y5zX9pOs4cRUgynT7wB3/H8kH0WkC/EU+v48BihwQj6Kt48ZJlhYIc
 +kS6EgKuvt6oPh0ykOrjIL2GXh+0jW65Oel5sEePmrbiaOa/wYbnaumrYsl2RKnM6jv3
 SFF/EMUDIHUsfCC0onAQBmV6goZZRQvgqTsT1uY6aJmquo9/ElLBacpP/HjDA8MpfcfQ
 YbEVuPti6q3R3ZAoYrq1c9PEjkRsvS+8jrVM7iPh4HT/1w6K7GymGcEASHG83nwBbCBM
 f34sva/JWaZxALhUQTH/iBsucT5p4AZoEsVX4BP7hzOUiYJnop7v8buTegPGroKOMApq
 J9wg==
X-Gm-Message-State: APjAAAXIbBXnWLo0qqpa4X/FLHKBACfOmlKqBYwKtSiNO1W95P+ObtGy
 Gy4wI6z4+orn1xBqI5mDc7E=
X-Google-Smtp-Source: APXvYqxmIa4QM7AcW/83pmrZJxqiFUk74JNfWaLeB0hSRpCmPT8473gpHyeXLWjKOEQDzkQWTtWY+Q==
X-Received: by 2002:adf:e5c4:: with SMTP id a4mr10230811wrn.87.1566633903310; 
 Sat, 24 Aug 2019 01:05:03 -0700 (PDT)
Received: from localhost.localdomain ([94.204.252.234])
 by smtp.gmail.com with ESMTPSA id w8sm16615656wmc.1.2019.08.24.01.05.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 24 Aug 2019 01:05:02 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2,1/3] dt-bindings: Add vendor prefix for Ugoos
Date: Sat, 24 Aug 2019 12:04:08 +0400
Message-Id: <1566633850-9421-2-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566633850-9421-1-git-send-email-christianshewitt@gmail.com>
References: <1566633850-9421-1-git-send-email-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190824_010504_914504_956C9D61 
X-CRM114-Status: UNSURE (   9.46  )
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
Cc: Oleg Ivanov <balbes-150@yandex.ru>,
 Chrisitian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Ugoos Industrial Co., Ltd. are a manufacturer of ARM based TV Boxes,
Dongles, Digital Signage and Advertisement Solutions [0].

[0] (https://ugoos.com)

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 6992bbb..d962be9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -965,6 +965,8 @@ patternProperties:
     description: Ubiquiti Networks
   "^udoo,.*":
     description: Udoo
+  "^ugoos,.*":
+    description: Ugoos Industrial Co., Ltd.
   "^uniwest,.*":
     description: United Western Technologies Corp (UniWest)
   "^upisemi,.*":
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
