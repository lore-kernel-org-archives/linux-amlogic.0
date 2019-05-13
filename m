Return-Path: <SRS0=LN9z=TN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 111CEC04AA7
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2019 16:31:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6CDA208CA
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2019 16:31:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aSgPYP9L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="kIjXz//g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6CDA208CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iIm8jWA1rT6Po8yv17JCEQwbPPOMhZbt1zx68CaQE5w=; b=aSgPYP9LXCdBkz
	JnuXe5xx568uH9zcXMiu0g3F8/w6hgtck2ZUNoMM9JdkmMXM7sHfDxd1G1eyMxm1J6dhnYZICSohV
	U/vUiu+RXqIHnqOpvnjeB7dl+MiIYQe+VjMOFC5GZZ1HZ0wq8lg5qc1CU7ykQT7m48DB+SvqbPIwY
	M+HbQ9hG9qC/dlmCKEDBf8DgLKADTFz+459p10VRBVbHxx4SZFylStXKmv2hq5Cvmy6HU6r0pQhum
	FCEN4bP5BGzno3+ax+F+CymLGhGRtHBkj2QgNeh9uy8BK0V4Ya1FrlJWuMEkkLiFVBAPidyr/AnjH
	9SciTHkVdeWka6/pd25A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQDrU-0007rL-PD; Mon, 13 May 2019 16:31:36 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQDrR-0007qZ-SK
 for linux-amlogic@lists.infradead.org; Mon, 13 May 2019 16:31:35 +0000
Received: by mail-pf1-x443.google.com with SMTP id n19so7491565pfa.1
 for <linux-amlogic@lists.infradead.org>; Mon, 13 May 2019 09:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=B032wxaSxEpjK9pKdC74UIRXdzFCuNECesldV5G8LvM=;
 b=kIjXz//gu34JmtpKR/dsJ1vaMB9L/2P9JKdACM4ZnrZf9kttODd7N98HnuFsEVpK3H
 FIdjl/FRyZnbbOTRJRV8suMt4wVHzS4puVd+He2wCyZw86kYaE7PwGgE65mZKz8zpvx8
 m16M2J/uGmFSVw12xYQdC2kH9O9BW+Ork2fQkP8Uz+GIaEyBXYZGvKooGAC274rZvpec
 iGEg2CrUt4GjOXKRlv/7EX/hdlW6bMXdDr7+Uf60Re/nYOrwXNcSUN8C9hxWLypcorIv
 KLxhUBL1CdM8nnMb1BjIQA4ek/gorM7PhHWs4EZxmiltYpeqqS6larlRaZ+Ggg0tqXRS
 cAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=B032wxaSxEpjK9pKdC74UIRXdzFCuNECesldV5G8LvM=;
 b=aSOBjaw5UmZgyxK9scIq6Dv2hPHuJo3kGk/vi73zz7/lWb2bpLYPvXtlZFlbHWy/TU
 YreCka22J2xYjJKo0oTE5ajStL71DCSW6qEKrVnqA5j7pfUg0xEW3bi6hmwaYyNl7lu4
 e6Uej4iAhozovMuzpaGhMzDJVoPBDlYSjx+ZaF5+L1/o5pIXLFTNpSAlLeE+9667lg5O
 /lfoh0QJre5mgjDT34GWJIpncBbQ2JIMioStT0ib3Fzqjb3UKJpqWn9Vo6IYQac/U/vx
 8gxZDfGVNt6CynV0G+BVGE9AdfnZ5V/CLP7JsFvByP6ZH4IyfSjqxYoNBuRTo9tVzXVa
 kIUw==
X-Gm-Message-State: APjAAAU4q64CgpmlxuSUr39/kZYoaF/BsWtDn/d5Ni3st1Tr7HX6r3Du
 kQ6tj3iZT99WeP8xHKhwdujVSg==
X-Google-Smtp-Source: APXvYqykyJVcUw9loEPh58IKDLQ8HHbmdX1X7MaIJ18vVl9tQx/WiDfdyA5qBoncQW+XhiG6PHGTUg==
X-Received: by 2002:a63:fd50:: with SMTP id m16mr32686277pgj.192.1557765091630; 
 Mon, 13 May 2019 09:31:31 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:fd66:a9bc:7c2c:636a])
 by smtp.googlemail.com with ESMTPSA id x17sm3939633pgh.47.2019.05.13.09.31.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 May 2019 09:31:30 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 5/5] arm64: dts: meson: sei510: add network support
In-Reply-To: <bf1360ab62a4e7bd3928052ebb6c969e8059f29e.camel@baylibre.com>
References: <20190510164940.13496-1-jbrunet@baylibre.com>
 <20190510164940.13496-6-jbrunet@baylibre.com> <7ho94ac4jn.fsf@baylibre.com>
 <bf1360ab62a4e7bd3928052ebb6c969e8059f29e.camel@baylibre.com>
Date: Mon, 13 May 2019 09:31:30 -0700
Message-ID: <7hftpico4d.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190513_093133_918165_83BA565D 
X-CRM114-Status: UNSURE (   7.91  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> On Fri, 2019-05-10 at 15:45 -0700, Kevin Hilman wrote:
>> Jerome Brunet <jbrunet@baylibre.com> writes:
>> 
>> > Enable the network interface of the SEI510 which use the internal PHY.
>> > 
>> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> 
>> I tried testing this series on SEI510, but I must still be missing some
>> defconfig options, as the default defconfig doesn't lead to a working
>> interface.
>
> That's weird. AFAICT, the net part has hit Linus's tree.

Ah, that's the key ingredient.  I was testing with a v5.1 baseline (not
linus/master) along with all my queued up changes.  I just pulled in
linus/master to test this series, and indeed, everything works, and I
don't need my config fragment either.

Thanks for clarifying.

If repost needed, feel free to add

Tested-by: Kevin Hilman <khilman@baylibre.com>

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
