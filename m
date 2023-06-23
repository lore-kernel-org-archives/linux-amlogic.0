Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018D0EB64D7
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Jun 2023 11:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dCU3ZPYj4jxqwRI4UV3lG3qDdiPeFUHrGQ1+owUib8E=; b=YqYp0r/jfr7ql/
	eyQOUPdVBvoadGizHq+RFsqGjN67HA6ozrSf4g0b+4F4eIFLSNJiJn6yRh9Zd+LmmNV3SrmM73ZJ/
	zdHTk7glTutqXiCb+w5ELUjXay2CIJK3FtRwcpQBNnD5W7nHx4ec6vH98ZB2CTJziqSFCP4taZVQx
	mf4bkq4INptgCUozMTzKQQe7Yd5q0nhy4DGICy509WwWPt5Jre7FsGyQx5NFj7jNJJi+Pv9B9DOh7
	XGr5SotL1vXxdjN8TuSOynyv9rqVKz1pLuK34ZC6GGjuZJ0B7yI6Bd2+Vsdr1MKqeo+ZkT+nBVov1
	8AtHqchLjdrh6eP5J6UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCetU-003Pwe-1l;
	Fri, 23 Jun 2023 11:24:00 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCetQ-003Puj-0b;
	Fri, 23 Jun 2023 11:23:58 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 033445FDBC;
	Fri, 23 Jun 2023 14:23:50 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1687519430;
	bh=40WKuG5jN7u47rR1N8bQt7QB0nFmgHe9lhfPp15dYpQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=grZYGVHuEo09bhs0QV2CoZlhgAcNo1pykB++zdadokLwQ7AwngjQ9RFJF2JzN5vpJ
	 EhVb10NH41aE0B2sKDKn6gRacu3jqTLmtWAQqrO9n2pP6AmUtzHP8es2tWy7zU8VGQ
	 DE7jvKw19sQ99fz9D6u/enc9YqI3tIHYU9BzlET32ojVhE5XWKsZ0ncPLJW8vD+4sK
	 5VZ9hDFQOc16K+J4qjN9hsCdWrUZOhRU68U8QXsvSWNQbLBzG8TJGWB6UyoHwhwlsB
	 ixIuscjLDVSZ5HDTpnpBHEKndULQfOncjImDvjDGY2tKmjf+3h60lmHmj29FV+8BQq
	 vOlG80yaV1Qww==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri, 23 Jun 2023 14:23:49 +0300 (MSK)
Date: Fri, 23 Jun 2023 14:23:49 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <conor+dt@kernel.org>,
	<kernel@sberdevices.ru>, <sdfw_system_team@sberdevices.ru>,
	<rockosov@gmail.com>, <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v1 0/6] arm64: dts: meson: a1: introduce several
 peripheral IPs
Message-ID: <20230623112349.reyls6um3dccrkl3@CAB-WSD-L081021>
References: <20230607201641.20982-1-ddrokosov@sberdevices.ru>
 <20230623082201.7tfnpjvwi22omleq@CAB-WSD-L081021>
 <dd5d7bc8-5ded-ebfe-48a2-55e330cd7544@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dd5d7bc8-5ded-ebfe-48a2-55e330cd7544@linaro.org>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/23 08:45:00 #21561595
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_042356_406027_81B08DF3 
X-CRM114-Status: GOOD (  12.23  )
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

Krzysztof,

On Fri, Jun 23, 2023 at 10:49:19AM +0200, Krzysztof Kozlowski wrote:
> On 23/06/2023 10:22, Dmitry Rokosov wrote:
> > Hello Neil, Krzysztof, Jerome, Martin, Rob and Conor,
> > 
> > Would you please review this patch? The latest modifications enable CLK,
> > EFUSE, USB, SDIO (WiFi), and UART (BT) functionality on A1 boards.
> > 
> 
> It's not a binding...
> 
> Best regards,
> Krzysztof
> 

Ah, I was thinking that you could also review the changes made to the
device tree board files. I apologize for any inconvenience caused by
additional notifications.

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
