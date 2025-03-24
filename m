Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B945BC36005
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Mar 2025 11:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RJiOeD2JjOyFKkqs74oKppeNdU++YT9fTcegAQCYiIk=; b=YEhJ0TN67vl2CV
	Lw8KGrTt20qF1KZExXKP/ect482oXziYKVhPmJLQusR9vJnE7ZX8UfsY02jC/3IcR7rN68cks+v8s
	BYvcnEVcWd4E8r1wmIpqSZAyfwLe4MmignmFwaHSmMpLlEorW3FBHylRW5ybC21fgV7LLGgx7XERk
	YIbxh3IzvInwGXkLIhfOi55p8Ix+NS9DsdWlAyFkRPM1g/swDGsMjzDkGx/AG6Skoy0kukWkbEoCw
	wGVnViEGpuSSOG61tn16nKk57UQg+yg6VrfbcafvVQnHzR/VZfFBZzdcdYjtU6+rqpTmbUKyQNXQ/
	Dd+m9tC3dFXGg16nV00w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twfZr-00000002uBD-3C75;
	Mon, 24 Mar 2025 11:02:43 +0000
Received: from out-179.mta0.migadu.com ([2001:41d0:1004:224b::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twfYZ-00000002u2d-1qlt
	for linux-amlogic@lists.infradead.org;
	Mon, 24 Mar 2025 11:01:25 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1742814078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fNcJg85jb8uy9BPEHwY/03BnrTApgjljAhujB76L3OQ=;
	b=mb56TlnpQ2C7KhQEa60Jci1EhHvGjef7HtEcDICRX1TD0r4ooU1qaLVYYQfo8ZkzrnjA6W
	hOXNmmclCAYps//MT6KIy1u3rRLz+++/Arlt8PHXLtrsH43IRK3fRXdeiuB4/DGailAm0W
	Og7X5LJ7Bl7RxBw7USIAe8iEwYPaQAsWiIinnHBcwZ1XG31KEJRDXHAdiuY18+/F8IoMcx
	ov/J2tLfPc8xY6I9sj48SWZwXB51DK9VGy7qtt6NltNAakWwKys9H071NSvnKJcCTfs/B3
	R51GnMEODCmGELfdr8t02ff/sN22pU/zixEqsrC0a72BAF+FjmUSdt4EETa+vA==
Date: Mon, 24 Mar 2025 11:00:47 +0000
Message-Id: <D8OG0OI3HO2V.326AQZHJWCBAI@postmarketos.org>
Subject: Re: [PATCH v5 2/2] arm64: dts: amlogic: add support for
 xiaomi-aquaman/Mi TV Stick
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ferass El Hafidi" <funderscore@postmarketos.org>
To: <neil.armstrong@linaro.org>, "Kevin Hilman" <khilman@baylibre.com>,
 "Jerome Brunet" <jbrunet@baylibre.com>, "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <linux-amlogic@lists.infradead.org>
References: <20250319190150.31529-2-funderscore@postmarketos.org>
 <20250319190150.31529-4-funderscore@postmarketos.org>
 <f36875c5-73bb-4bf8-a59f-5df30043bbbe@linaro.org>
In-Reply-To: <f36875c5-73bb-4bf8-a59f-5df30043bbbe@linaro.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_040124_160875_93904701 
X-CRM114-Status: UNSURE (   5.85  )
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
Cc: devicetree@vger.kernel.org, Artur Weber <aweber.kernel@gmail.com>, Karl Chan <exxxxkc@getgoogleoff.me>, linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon Mar 24, 2025 at 7:02 AM UTC, Neil Armstrong wrote:
> I get:
> Error: arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts:243.1-2 syntax error
> FATAL ERROR: Unable to parse input tree

Yes, somehow a ";" is missing.

>
> whil building, could you fix that ?
>
> Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
