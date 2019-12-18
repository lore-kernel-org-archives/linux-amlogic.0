Return-Path: <SRS0=A4ao=2I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF0DBC43603
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 18:13:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9274521582
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 18:13:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kNghYR0X";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="UW4z10ZF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9274521582
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=p8naJ5kueT/03hjQqWy19qmEWSzxYPwiIGbr422nlhQ=; b=kNghYR0XE/+g6QMP3VcmPMoTBf
	m2rm3x7a+BcmQs27KMjQWN2KolSlcvK7APLL0imzo+pYOBUQ44+5dDLc3Lpgw3orqb4beLPbPwW2S
	OgO4GE8cj+Q37RfOPA0In/kR9wThHBl9UQKQbeRArdk+EG9zkP9FA5dLRc1GgLYS95QJaPkhr9RJj
	UVrOLzsQJoBmMYg6AnZm5kYwlCB4xCQFJ15JDiUatPOQhZ4z+xiQdX6040LBBfum8nBkiWTZhpiT6
	8s0hIxOR8agIq1BqmHD/4b7OC6MdWUKauLOBh/a+GT+Bod/goAbFCZTHy7UchDj4k3pUbDVPtr03i
	friIPZNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihdow-0001vv-Pa; Wed, 18 Dec 2019 18:13:14 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihdou-0001vT-9U
 for linux-amlogic@lists.infradead.org; Wed, 18 Dec 2019 18:13:14 +0000
Received: by mail-wr1-x442.google.com with SMTP id t2so3350628wrr.1
 for <linux-amlogic@lists.infradead.org>; Wed, 18 Dec 2019 10:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=s6pr6X3YZWixb8igAL5ZzP135162lw6kkNkrAE5nvDY=;
 b=UW4z10ZFcOooL2c6GdzIvB9hmP5SseKfAI01lmvsAEbvOsrbWRmG8k+UDXtTLgnaM9
 gm2KqSYCyAOdc4YVMUZe4K319U183tNcXM872/5G0/gAs1i+iaUHQKiMKr747n6P7H1A
 YHXU6qxJ3oy4K+nWuCo6q0/101Zo9ssfrjX2grmDbtYOxTZkVGyQ+qH6dRHobBqWxa1M
 nIIVB01E33kFsHgdbAF+OVbVhtPJBpgERrJzzZG7WXk1APl7JNGY2Fp/gqFhtL2W7/LP
 Z/+75Nq94y6KhsbiFMDLZB1RmH3ScSQQX3cQaFbNa3OaQN7mg5QU2gqXUUQP/vSOqS5w
 ezMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=s6pr6X3YZWixb8igAL5ZzP135162lw6kkNkrAE5nvDY=;
 b=hIF3s8hD8PLyJsyGsjkZ4KJr7BAMa17egf1ADJMz3UKtyaEvrB9oXNs49m7j/mi1LF
 YsUSlnoTIQyQ0gv3dkHiyAYL73bBC3H2A7aWwgFewy7OLkRpbSDNBnkcynshFu3ujBY5
 UOM/qmcXRHl0Bsi62qxGJnU2U6bAqmEpuYmGQMae5PBsxAmK1vKXvObV2DC534GNz/lP
 SOlNIRmkEC+hYNaRozsyz9G1Tai+elh/Tae5KEkCIDTz5yub6jMFkG5+k+kxAXAyALVi
 KHPUDFO1tgxG/vn6rRwp0c/KSHvfmBMHL+icI2DdMTs+sd3U+TyvfTU2sk9KyFGxXvh8
 m7hw==
X-Gm-Message-State: APjAAAXCoXd30X+Kt/IM66wYEo8cHnRMY3kxGDl2l7KcOxhxyROmAptd
 HHZA54f8syPjsclbgdPzQGlLRg==
X-Google-Smtp-Source: APXvYqwzBRl3g+BhMlJHg5Zu4pGS3x1Uk52GVE05baVV87Pi+U0SnH3/RibUeAZUwELOwUZoc+WBQQ==
X-Received: by 2002:a5d:5273:: with SMTP id l19mr4372382wrc.175.1576692790684; 
 Wed, 18 Dec 2019 10:13:10 -0800 (PST)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id h2sm3396271wrv.66.2019.12.18.10.13.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 10:13:09 -0800 (PST)
References: <20191218172420.1199117-1-jbrunet@baylibre.com>
 <20191218172420.1199117-3-jbrunet@baylibre.com>
 <20191218175031.GM3219@sirena.org.uk>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/4] ASoC: meson: axg-fifo: add fifo depth to the bindings
 documentation
In-reply-to: <20191218175031.GM3219@sirena.org.uk>
Date: Wed, 18 Dec 2019 19:13:08 +0100
Message-ID: <1jimmdbiyz.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_101312_330762_615DB832 
X-CRM114-Status: GOOD (  10.33  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Wed 18 Dec 2019 at 18:50, Mark Brown <broonie@kernel.org> wrote:

> On Wed, Dec 18, 2019 at 06:24:18PM +0100, Jerome Brunet wrote:
>
>> Add a new property with the depth of the fifo in bytes. This is useful
>> since some instance of the fifo, even on the same SoC, may have different
>> depth. The depth is useful is set some parameters of the fifo.
>
> Can't we figure this out from the compatible strings?  They look SoC
> specific (which is good).  That means we don't need to add new
> properties for each quirk that separates the variants.

I don't think it would be appropriate in this case:

If I take the example of TODDR fifos on the SM1 SoC;
All the TODDR fifo on this SoC are compatible with the same driver and use:

compatible = "amlogic,sm1-toddr", "amlogic,axg-toddr";

However instance A on this SoC has a 8192B fifo while instance B, C and D
have 256B fifo. Same goes for the other SoC and also FRDDR fifos.

To store this difference using compatible I would have to add 1 compatible
string for each "A" instance of each FRDDR and TODDR of each SoC. At the
moment this would be 6 more compatible string for something that is really a
parameter ... This also shows that fifo depth is something the HW
manufacturer can tweak easily for each instances.

It would not scale which is why I went for a property.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
