Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F61CCC6B1D
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Oct 2026 09:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BtMH7x2KOyMGTQ61cQFgovdsInPA5oKHxBSPkY/pgsE=; b=ts//hAIfhPFux/
	ZY5rp3AuBtStxP+DXSc7lDULtUk1L3COfIE5A8L400LUD9urPtvKY+KXXHKvY/qZna5hSjeJsoTkv
	B4X8GsSsXmv4xQzpmDnGlQQ9ju9wSu8UFZcB83/plExBVQlPfaCB4p3300SlwCEk8Is3hXhdkIkeL
	H0Rpu/VrPTM4j1nxcvMkf0xFgX+lpFWGF3ZyNJFlWcO2UZtKAnHiuAAU+Z/A499BU82ownrzPtB1x
	sHh0PInA0awY5Y5f4Sx4a6Xu4WK94M2w97wC6Yr8V41CvpLQaYSUaKEfDGTrIhpgtB1vy0oqf84gq
	2gGP2jPtvxKbxIKuvcMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvVg-0000000F5i8-267K;
	Wed, 14 Oct 2026 09:42:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvVY-0000000F5gX-3LMB;
	Wed, 14 Oct 2026 09:42:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4051D601F9;
	Wed, 14 Oct 2026 09:42:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0FE71F0089F;
	Wed, 14 Oct 2026 09:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791970968;
	bh=WRJ0kKX+qUQiEo09SQo98BdSeBq5k2bcrC2nZTSyaOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j6tk/qRYxvqEmmRPCmcuRIlVkjwE//jShdwiY68mMo5nX5vgP1oAkDTSNVg3tp78o
	 a6IRNLT9lkw/0IyqMk9UoywkS6WZ51ngVzuZPNMuL91dbV8ALYEqTTQnwDYJBhwNbX
	 b+QyShT+jesGHQjTt7ozLujCHu39MChLCsBQ01HocAViG6S1948tqa6dk7ljlk49Iy
	 HuOnutzBPY5flW/RF2N1yKJTv/XquglzN0A5KfSOn9b7NoYxR205wzIqMNMCx5Mf32
	 brTpMRm4k457KeyltRyhTRtx+YqQTYKM7zekJG0/niYVjvzsw9lWDkG8UpzRJVtijw
	 GyYy4xas4TIWA==
Date: Wed, 14 Oct 2026 11:42:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zhentao Guo <zhentao.guo@amlogic.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v11 3/6] media: dt-bindings: Add Amlogic V4L2 video
 decoder
Message-ID: <20261014-notorious-pretty-wyvern-39ea3f@quoll>
References: <20261012-b4-s4-vdec-upstream-v11-0-25939f85ada5@amlogic.com>
 <20261012-b4-s4-vdec-upstream-v11-3-25939f85ada5@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261012-b4-s4-vdec-upstream-v11-3-25939f85ada5@amlogic.com>
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

On Mon, Oct 12, 2026 at 03:06:12PM +0800, Zhentao Guo wrote:
> Add bindings for Amlogic hardware decoder accelerator.
> 
> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
> ---
>  .../devicetree/bindings/media/amlogic,s4-vdec.yaml | 114 +++++++++++++++++++++
>  1 file changed, 114 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
