Return-Path: <SRS0=UlVA=OW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D35BC433F5
	for <linux-amlogic@archiver.kernel.org>; Sat,  2 Oct 2021 06:57:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FC1B61165
	for <linux-amlogic@archiver.kernel.org>; Sat,  2 Oct 2021 06:57:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1FC1B61165
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=mailbox.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bfHHAKU0GEOUir0LTOY4tKyldbpWfeaIBWHsbq46GyU=; b=z4pUIPLrlKDKZ6
	FNIK4xUXdjz/tPErm2sffjkahuu5nwjKpox0NVuDNDkk62GhxhCSU5lTecp0VeWAbdf2CmIMvwn+j
	4rkkvSSzgCzgtpqX2udC0zJyydUA/SGVaiKL44Dxh7fwC+8F9XvOzD0NY2Idd3zMVjh7EXuozvSGf
	0MNeeY+NPB3nqn1PvmUcLZd0PR+wyr289FIG52gMXpJybwvZRqs41Tv63dg9JhMJIMqgvP/a2ZXJS
	c2+QBqOk0th203DrsCT2abGpTHe62/Az68GpBwzsWH9UzJPwva2KcVm+ZmNWX+TARwwqF1noCSqZ4
	biexpo9zh8MK7DgwSS0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWYx8-001sQ4-75; Sat, 02 Oct 2021 06:56:58 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050::465:201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWYx5-001sPM-Ku; Sat, 02 Oct 2021 06:56:57 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4HLySr2pc3zQk3T;
 Sat,  2 Oct 2021 08:56:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:message-id:date:date:subject:subject
 :from:from:received; s=mail20150812; t=1633157800; bh=Kbdp4ImEa6
 wUE7fQ+D4duRRbC1+0FN8uxmoUD4q7h3M=; b=mGAs7LO5p9VyDH1euVA+AZ4RBn
 aXZ2aEoGMUkOg54MXZjTr3x7JGBm5FZ7BpP+LAlMBJxwf5nQ5IpT9AFwEkkOWqDz
 SeLYa0wJSRmYiUxyCSG+jgNBcCV9wlXeXg+63tsa+YmbccJkwPBW5ab/XhMpWkBz
 27HSHAcdDWBR8lTFwR/Ibc7TnSaaPo1u2q+XJVjkORzW8xefPPRHzDSEsyJXTZaT
 1t88gwuU7jQ3Z8bKbdMhkj9htV1KyZ4c1BBUoZx9oO3s+BOe8VsFP7bKVF5sTO79
 0MXO2pu2pL5xsUrFNl4MX5oUYDa6EFGPeKjypqb87/klMGeOygQqGNLgvu/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1633157802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kbdp4ImEa6wUE7fQ+D4duRRbC1+0FN8uxmoUD4q7h3M=;
 b=Y+COZ7A83wIUBSGSZS/viSxqF+JNvHgIV1aQEYROfQ6zYP3JD+XnoXsm22yr+qxzbRc3JN
 9/rjSWrV/jtcGEsrgmeN0OtLMAk8VJGATf4mAcu4SCB8CAAll2Ys3EmN2e+rQwB46KJB3p
 JvHApGsbQWBh7Z8l2PO3I5E3T2USb9AytmVikVFEBJu6kIvkwgQZqhyoZL7AH7rnfLDb0w
 2zMH9V420BAbt1vB4ddwIDPSPkohDKpvrJiHB8k/x2UsM0a6C4p1JHB1qGgd3gpQ+w1vnu
 ketNudt6dT4M24fzmn+RbJg1jXmbHILKm2WmszJU7oLtqBQ40ajMKPJk1aJLsw==
X-Virus-Scanned: amavisd-new at heinlein-support.de
From: Alexander Stein <alexander.stein@mailbox.org>
To: Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/1] arm64: dts: amlogic: Assign a fixed index to mmc
 devices
Date: Sat, 02 Oct 2021 08:56:37 +0200
Message-ID: <3603832.OnnjH37t2F@natsu>
In-Reply-To: <7him6135iw.fsf@baylibre.com>
References: <20210127230852.66686-1-alexander.stein@mailbox.org>
 <2921197.CJbAp5Dgou@natsu> <7him6135iw.fsf@baylibre.com>
MIME-Version: 1.0
X-Rspamd-Queue-Id: D5A881899
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_235655_912008_F7DE580A 
X-CRM114-Status: UNSURE (   7.86  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello Kevin,

Am Montag, 8. M=E4rz 2021, 18:43:35 CEST schrieb Kevin Hilman:
> [...]
> Sorry for the delay.
> =

> I somehow missed this v3 at the end of the v5.12 cycle, but I've queued
> it up for v5.13 now so it should get broader testing in linux-next now.

Was this patch [1] missed again by mistake? I can't find it in linux-next o=
r =

anywhere else. [2] also shows that this commit is not referenced from any =

branch.

Best regards,
Alexander

[1] https://patchwork.kernel.org/project/linux-amlogic/patch/
20210203192824.854491-1-alexander.stein@mailbox.org/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git/commi=
t/?
id=3D7827db7f6141fda9af4b07864cab0c10398affff



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
