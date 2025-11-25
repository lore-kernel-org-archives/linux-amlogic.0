Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8379FD0E6C3
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Nov 2025 11:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:References:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h+b/TcUg+sgms2cpuWcqb6Cf6iCXi64MCYQ/hBqdZ00=; b=bxfIny/J/Y4bl6yFSIdFK+72eI
	y5wvV6sKsWwmj+yV4L9REvYDAhqmpPym2X5Tmy2bGKGFYfvCLTEhsIorIl1EMblQGP0hh8yhjnRJS
	hDUywHtvKgl//2fmV6LDrg/t3QJqxGrj4VyKXs5YWGHys4gg37sd7zRWXliJZ1ynxZdhU2RAq/yP1
	dp2CLnWGG8IESx9vs3X3/j+MlT3i5mnkwC7v6ENBXzC4nHsp0F8+Jaurbw6Z3ubjja1fUHi50bLhl
	NUTnpt37+JTb4DCO88q8VK8uZPSdAvRpCf4o0HZqrsJGqzhRS9DnBf+oBfkcB5SeGZX+Bcph9tE9S
	IvcTf1tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNqsb-0000000DB6t-3ioS;
	Tue, 25 Nov 2025 11:06:41 +0000
Received: from out-178.mta0.migadu.com ([91.218.175.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNqsZ-0000000DAzf-0CPz
	for linux-amlogic@lists.infradead.org;
	Tue, 25 Nov 2025 11:06:40 +0000
Date: Tue, 25 Nov 2025 10:55:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1764068673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DNJj/nIupmc2+udqdLaCJttRVrZJNDSAJL/mmo1q1hc=;
	b=WIAIgwXLNHuSBZuph5uAOA9s4/KfgVAjq0+QflDWNZbLAvE6zp5i7yDTM+sck00AP+2+TR
	9L6enTVl5og3OlvZ6mIi7ynYRzTQtomlcobFXWEXafsS2i8fUIpi7NDFdNHfafcGgk+aez
	wk2oox0VGklRm1qDJ/Ze9hWfvBcCHRufycHRpicJkQeu3PGJmk4MkQx5E3QG0wkYAblJjg
	YmqdvyjHM9xIN4zYg/1xWJhmioNsoXdl9q2CamD5p7S5XhrMYsjkGqz7kxuVqQk3OH/B5D
	hftlet/kuiw8+0dkov7H1jWfzHQXo2DJfnWmfo/yNJFZiaRIlI2FVYyjaX9Pow==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: linux-amlogic@lists.infradead.org, zhentao.guo@amlogic.com, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, Zhentao Guo <zhentao.guo@amlogic.com>
Subject: Re: [PATCH RFC v2 0/3] Add Amlogic stateless H.264 video decoder for S4
References: <20251124-b4-s4-vdec-upstream-v2-0-bdbbce3f11a6@amlogic.com>
In-Reply-To: <20251124-b4-s4-vdec-upstream-v2-0-bdbbce3f11a6@amlogic.com>
Message-ID: <t6a43h.17cuodq0mx1pi@postmarketos.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_030639_259261_C01FCCC1 
X-CRM114-Status: UNSURE (   7.19  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


Hello, quick drive-by comments:

On Mon, 24 Nov 2025 03:32, Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org> wrote:
>Introduce initial driver support for Amlogic's new video acceleration
>hardware architecture, designed for video stream decoding.
>
>Compared to the current Amlogic video decoder hardware architecture,
>this new implementation eliminates the Esparser hardware component,
>enabling direct vb2 buffer input. The driver is designed to support
>the V4L2 M2M stateless decoder API. The initial phase includes support
>for H.264 decoding on Amlogic S805X2 platform.
>
>The driver is capable of:
>- Supporting stateless H.264 decoding up to a resolution 1920x1088(on the S805X2 platform).

nit: 1920x1080?

>- Supporting I/P/B frame handling.
>- Supporting vb2 mmap and dma-buf modes.
>- Supporting frame-based decode mode. (Note that some H.264 bitstreams require
>  DPB reordering to generate reference lists, the stateless decoder driver
>  cannot access reordered reference lists in this mode, requiring the driver
>  to perform reference list reordering itself)
>- Supporting NV12/NV21 output.
>- Supporting Annex B start codes.

Best regards,
Ferass

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
