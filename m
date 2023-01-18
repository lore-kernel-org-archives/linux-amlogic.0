Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81E5C38147
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Jan 2023 17:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u43YGo+1FmDteqJ7U2iAQReXpK+9tJU1uXBEuVfJtaQ=; b=XnGDYC3W3gE1hS
	9EhQfghWbpynz40Q371Jos5r5G6FWNmRvjUPtyNfEwEtjyDshVjP+BICmMwfwWEc8uOoMI8Lj8w6l
	53BBdbqjfTJcUVXufd2RxyQl199Xf5y5uCrr1WokVt6g9siBnnAFa783fswU6ALQd4DNdHyBZyI6L
	cY0D7QKZl8ohVcvgAQcoWvJxvNzeQzRc/whuOPkMxLI1kccBh/4S88ahm6Q6pR98ZAEbL/PQOcCID
	VLhfEBCp3/oiovJzgYWkiVJ6a3KFmGuyK9vYAEhipHdmAMWb+IoqbT46zPCBaIFnQQecZTtiCg/0d
	W9QtnkMotkjj79p+AlCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pICDJ-002198-DY; Wed, 18 Jan 2023 17:27:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pICDG-00218D-6k; Wed, 18 Jan 2023 17:27:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6E2FA61789;
	Wed, 18 Jan 2023 17:27:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C8A2C433EF;
	Wed, 18 Jan 2023 17:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674062820;
	bh=BvKSOudmvgU0WLOSTyYGHObuB3lNc/Lj3KUEm5JfhTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z7LYo9K16WhEtP5lNaeMXkZm3bCgX7DKPkaiXQsJf0VN7JwtWc3z/t9WDADgjk+Qo
	 hv9GVL6uNp7M5+a1LOm018oQyPg1/eyavh7p4wd1LCcEEBT9VyMJh1kSKOQ1ppyysQ
	 P0cYwSkqFyu4V2rE1BKkR7uxX8te5t1336tmbmvRmCYX44WAxG1Qs+n83eiv5UXr8f
	 MO+xEb52Dqi1aQdjUg/iHr5cuS8WeCTPkjxJjCllRuYTkAb0dlIjHYDLLP6hTy14rz
	 YAsxV/3r1KTtH0ngKlUC+WvTpMHFnbgCk0WccgYmlec1zUlEecWZdumK+ET1xB9ZDL
	 F5iDouwSVl4cw==
Date: Wed, 18 Jan 2023 22:56:57 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-phy@lists.infradead.org,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH v2] dt-bindings: phy: g12a-usb3-pcie-phy: fix compatible
 string documentation
Message-ID: <Y8gr4dJSNBitl9ze@matsya>
References: <0a82be92-ce85-da34-9d6f-4b33034473e5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0a82be92-ce85-da34-9d6f-4b33034473e5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_092702_303672_7F639A76 
X-CRM114-Status: UNSURE (   8.11  )
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

On 16-01-23, 21:19, Heiner Kallweit wrote:
> The compatible string in the driver doesn't have the meson prefix.
> Fix this in the documentation and rename the file accordingly.

Applied, thanks

-- 
~Vinod

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
