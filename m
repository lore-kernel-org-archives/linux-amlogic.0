Return-Path: <SRS0=eZXa=KP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D129C433B4
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 May 2021 20:19:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3DD560FD9
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 May 2021 20:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3DD560FD9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LxArr4X06y2AR9fr+shpmnwxW6X32x7sx6yN4FbJI5c=; b=nGHa0Mpfc/mBq7mDWk/EHJ9Bgb
	QNsZHq39DQJaMSRXcOUttIWLOMM2xkmskqIm+KPzjDFODSLmfHFNQW8is/VsFMy/ZpBrjYQCTbxmw
	4OVixhXF0EQxFlkbWi0Xi9EaS7t8ViqoElTSyxp51pOFjNXmybm1mnl8Ttmtz9jqedwIw+Kq86ghZ
	yd6S88EUZmhf8IgUx5XZB1e8TzH4pCTPNuttu4fQuaCthJdC93yf9/0tvF5Nz18peGLnMm3oTZeg4
	ebdyWrvDk5bB5QPk1txHb77d05Yvj5LGyNvE8oD5k7W80wa6g45CS3/zLTHum+Ztfsa85zB5AAsgX
	cGf/u+HA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljp89-002crU-RF; Thu, 20 May 2021 20:18:54 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljp7r-002cqN-QJ
 for linux-amlogic@desiato.infradead.org; Thu, 20 May 2021 20:18:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=yiN+nJM5afs1OG+wImwlgCn2IyQHVphWRabagEo0dzQ=; b=xFp+WPMMzuwlMCz74bvcCh8GWh
 6tpNMqa5pw4qzelk+ohiYrIdUB7tLYkgUQL/k0QLeiSA6N48dhj5RiCh+eIXGcMMJ9TNmv0mBwVFu
 /WX6IrpzrA39aO7CEMf1xzPEr5hOn/0+B0Nb/E/J+BjxigrEBgpPJF4VPeQ9QbaMpPeUsFq1ZFvRw
 6r8cRWYQjxyEQ+DHpxMGZe+98CSeHzmyKfS4GXFbQFYu8qLdjJjmhrJDs7krmYZ4+IvzjCFnBxFpM
 2ptuXs32OcEJCufHJe1uWXKmsXoWyudVmugOBccpJV/F9r/cpYcc7IA7bxCXqYmpHBEMMpuNxvMNZ
 8wQ3O75Q==;
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljp7p-00Ge2x-8Y
 for linux-amlogic@lists.infradead.org; Thu, 20 May 2021 20:18:34 +0000
Received: by mail-ed1-x531.google.com with SMTP id t3so20833504edc.7
 for <linux-amlogic@lists.infradead.org>; Thu, 20 May 2021 13:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yiN+nJM5afs1OG+wImwlgCn2IyQHVphWRabagEo0dzQ=;
 b=QSGvHqzhGYJ4117Wqeq8ym6kwRhKgpJqNuh6Bvx8zZ0kLJifGJbY5egYAe4aJZmzXb
 nX242ZRJzpWZN77DMgaY0D7g/lhMHmt/716EAIr4mjMIQf9MJpvBEVAO+FHf4HYTrrL1
 TuZPO+xs6iVdZYaXEEzpnqWfBUwsrJk5bbrRlAZx3JYFUzs0tLw2INE2fWL9ADmtyznQ
 iUle1zltt8OvTEMAe7rnfRtjlpK4hQjvnEF2PVZ5OBFfhok+obxgKZrDAhD6nyw8POmH
 tNAY68O/j8Ox/wSjCyYTL8mm4xw2ZEwU6nuj4U2VVpxXHl1t9qs0jUczgAoLgpJlDB3m
 Vwag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yiN+nJM5afs1OG+wImwlgCn2IyQHVphWRabagEo0dzQ=;
 b=jXseJdy0wTcqtoFv/8vrcsmP7QVN0s817VZlhu1LRgZDgRmPuM7HA9wOycOORlLzzR
 CNy9Kze3qsPg1Z5WN4POwoUcneVTeNhqtprn7Zz2oN2H6JJKHd/CTV+cKEu118tmEl1M
 TOuMaDsit47nmioJOI84bEYj6ReTCNDZ4lywdsLG5MC5vaAv7IjhloRh8uIOvKTtic/+
 n2mMEGwwr4jAXzMRv/tJNMmxsWRJtU9BpMKuSRf1gciet90DZd4uTzM/+rN5PhdYEJQE
 ADiRUp+4VBstG+TjMPxGILRvrw0iVDYWsoz7o3uqmEMK5AWoXsjTMDSzfcABI3rbGskx
 CdXw==
X-Gm-Message-State: AOAM533aqE0rd1SQ7sijVaed8xDRfPB3CR1ubKrnq0lt0Z0v4LGe3ryd
 Q8fC/9P+O4f/RCMNV6fP2MNNBh21jIRoKN1Hiec=
X-Google-Smtp-Source: ABdhPJybuLLiK/78YthsNpjiYoeKG9AfUVaCV5etxUAmLyjkMi3piYNmFQTmaU4a4YpzM7zukNVg4eVG9cgUxSq9B3M=
X-Received: by 2002:aa7:dc12:: with SMTP id b18mr6789458edu.52.1621541910921; 
 Thu, 20 May 2021 13:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210520073136.272925-1-jbrunet@baylibre.com>
In-Reply-To: <20210520073136.272925-1-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 20 May 2021 22:18:20 +0200
Message-ID: <CAFBinCB=pAipcZOi8S005SyO8ptfzy8oGpW4S8Pi++A5-Jc5eA@mail.gmail.com>
Subject: Re: [PATCH] clk: meson: axg-audio: improve deferral handling
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_131833_336187_5BFFEF0F 
X-CRM114-Status: UNSURE (   6.95  )
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

On Thu, May 20, 2021 at 9:32 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> Use dev_err_probe() for clock and reset resources to indicate the deferral
> reason through sysfs when waiting for the resource to come up.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
