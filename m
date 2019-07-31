Return-Path: <SRS0=czMH=V4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDBBDC433FF
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 16:56:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F7CE20C01
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 16:56:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tTHMVVgM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="o/YgXu/1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F7CE20C01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7s3U+F7k+WBsnywMSeyfqAMlIrXtXTjHKdzgJ3YHIVE=; b=tTHMVVgMnP7iGJ
	7DzgkZCvVOvtAU3QDoux5fKCw89jrbsPcme3+mYz2ghqGBxkAdtic706VXUSm79zjt8nuRDxMCfaC
	VjLc+HzRxTrxdHh5TfDu53g4zNe92JMJzZImqY7/uwEWqUta3FP9GCyrpooGmd5Uqwgag50PTgVHs
	/7E3LrX55pj8UpFcuGWtZ4oHGBMAWv2NO5jw75PP4uWUoU31uk6HbPgH0VZk9YPWGxot9KLSLhNGj
	Lo9SUm+le7unYqnGREUyqIyii7XTW24/bxe4AE75T9A3g44HJZQCfU9uIhCsAlFgeg88AODz7FYHu
	NgH2QsDbjX8I8XXGtbVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsrtU-0006Pl-Vm; Wed, 31 Jul 2019 16:56:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsrtL-0006Or-9M; Wed, 31 Jul 2019 16:56:03 +0000
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D3EAD208E4;
 Wed, 31 Jul 2019 16:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564592155;
 bh=bu2/IzitZpcqBSeCvVLwvyS9Pg3PnwR+a5FlsLqKfwI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=o/YgXu/1eTjtGCGzZ/OwQR5HDIIAYPv1s4Ry9B/VG0+8TbBTE9xc/OXQM/EHcYcZ3
 X6RpcDqanN9nOJhH5PO31520ZAzINdR7OqDxxCWR8dU1jSDIrRI0dU9GoiFRPk++8Y
 ynZqXfGcruJQ0nDV6aK5D5raa2FrgKfkWnKPg2iU=
Received: by mail-qt1-f170.google.com with SMTP id y26so67295508qto.4;
 Wed, 31 Jul 2019 09:55:54 -0700 (PDT)
X-Gm-Message-State: APjAAAUaai8J8CKi6Kxff2UDBMvCJGDDbgPONJl+L2n6u/i/Zw9u69b8
 pzxb2yNjoKqtVR3AIdmIt9f3BUbqCSlSjuxmOQ==
X-Google-Smtp-Source: APXvYqyvNP50u9cI3UCf6+YAQwdF9Av65FYOMp2vrFwHw2oLly8ZNSDLF7JYdlfrkafL15qyfM8KXu+yB6C5vKjJVqw=
X-Received: by 2002:ac8:368a:: with SMTP id a10mr86824910qtc.143.1564592154073; 
 Wed, 31 Jul 2019 09:55:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190731124000.22072-1-narmstrong@baylibre.com>
 <20190731124000.22072-4-narmstrong@baylibre.com>
In-Reply-To: <20190731124000.22072-4-narmstrong@baylibre.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 31 Jul 2019 10:55:42 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKFacYY06keqny2RTvCd1R6eDmZmVG5WdjoDHdfwAObgg@mail.gmail.com>
Message-ID: <CAL_JsqKFacYY06keqny2RTvCd1R6eDmZmVG5WdjoDHdfwAObgg@mail.gmail.com>
Subject: Re: [PATCH 3/6] dt-bindings: arm: amlogic: add bindings for the
 Amlogic G12B based A311D SoC
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_095559_114985_2F73E3BA 
X-CRM114-Status: GOOD (  10.25  )
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
Cc: devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-amlogic@lists.infradead.org,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Jul 31, 2019 at 6:40 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add a specific compatible for the Amlogic G12B bases A311D SoC used
> in the Khadas VIM3.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
