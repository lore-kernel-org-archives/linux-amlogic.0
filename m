Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FF8C9830E
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Sep 2026 12:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/SJmTYQR1vZ2MdM8n2dGWnaJA3/His8kIAjco0rw6IE=; b=024qYXoplVikwg
	8aqVEr7aabWiQUnLEmc3LnZ5EH9pwOF5XLW57OyVmLnCKoTpgMvg+7dHu1EfmqzoQU56j2Qzanf9J
	fXVijNEZVvtN4zUgp4xcY2G4927qJFvjXiwbMwTQg3jrL+gLB4ccGXaPa4EyLQcR6jIsnNgO4RkdO
	aKfbUiEA2hjprZrJ6DcNLIRzWUZaXlmdf4A6943DHVoCUTCDWQQymSoLLSQkzXG4wqFFy+xUhIWBc
	CiW06mS/NW5t2P+zjkRIa/Lezb6dQM+EadBvlYI2RLyDQLB6u7aoIQKhDareA26ER2ZIb/X9L/MWu
	DNyN241KmXfkmWrQO9LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9izw-0000000B1in-3aMU;
	Thu, 24 Sep 2026 12:56:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9izw-0000000B1iZ-1Dih;
	Thu, 24 Sep 2026 12:56:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B17644001D;
	Thu, 24 Sep 2026 12:56:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A04D1F000FF;
	Thu, 24 Sep 2026 12:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790254583;
	bh=7+tkMPSWDlHQYFcrU2RO/g7XreK+HAtQ9qaL8xnkmGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I88jW1rSOoynMhq//Z5Drjd1alHjadA5ziFptEv0Lj4KevC1wmaET4oi+8g1CFK+I
	 Obziu571unpEOOQ1ukGNPpmF4duafx2CZ3Eg4OYGu29+l6OAdh4FCPjqy4qpRWflIv
	 jwkmk9AcY2lKU4XpSNYsjSG3uG9zXmuBNNhisyJ2A5aGRpEagAkjcwccuK39BPafNm
	 CHuZGkFdlKrGRV/fpNuWSME7a8hM9dPTBrjHCQ2/9va0FlqCMBAyOrfDJmlWedLXZT
	 S7bY8tPZzkuLb/kxtChyCuDySlqZcSHKQZw71ZIb8lXd2VejFQHSprugduyvgiVva0
	 UIGzmQne1wQFQ==
Date: Thu, 24 Sep 2026 14:56:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/12] dt-bindings: soc: amlogic: Reordering
 compatible of clk-measure
Message-ID: <20260924-truthful-likable-myna-c9ebac@quoll>
References: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
 <20260920-more-socs-to-support-clk_measure-v2-1-224382a429e8@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260920-more-socs-to-support-clk_measure-v2-1-224382a429e8@amlogic.com>
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

On Sun, Sep 20, 2026 at 06:25:03PM +0800, Chuan Liu wrote:
> Sort the compatible properties defined by clk-measure in alphabetical
> order.
> 
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  .../bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml     | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
