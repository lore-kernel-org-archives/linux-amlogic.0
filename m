Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51EABC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Dec 2021 15:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=02CuFEr9ENrJys1T1jZbpRP9te1YvqfsCAoIeo/FKqM=; b=sy0uiZLLJctTYI
	6vhxtFovzfUvSFtWffsUlVrA2b2h0QpuaLS5LBmW18NjjpECXQ2cNVU4VN+iqoB1tED+gZdC1Yv8N
	q3+RhKAFhvpFjvJGVvBUZ/91/YPmwNC/horw9JUqgPW/FZqIn6f7E4AqiQSdmbHpGLuLCYld1qkUr
	/a8WKqxYUYttVP/drPzKQi9cFiRpawks30njD9T1pNEKXCjK/M4VjmBrtanvq1O4NupFhhfn6eZXl
	9tX8uKsXnYKC2Q6Odbz/mjn6uBV9wX0VliuyoFVuEe8GyZO6aTVfE2jOpI3g9xJlSeJWkSIvD/DEe
	7LdudPSG8u+CoiM4xDuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzKkP-0038JI-HI; Mon, 20 Dec 2021 15:38:45 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzKkM-0038I9-U8; Mon, 20 Dec 2021 15:38:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 70C35B80E22;
 Mon, 20 Dec 2021 15:38:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA2FC36AE8;
 Mon, 20 Dec 2021 15:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1640014720;
 bh=jZvynrgI+mxHpvVo0uaXVLOSajCtjusjJQ30p1o6rAM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c0R3MBQJsWmThAFc34m5Ge23P+ocG1gjNawN98lNlawF4MCecQILD8vMBnDbOb8vd
 gnGkGTJ/lTYaZgN1SrnL8nE8QUqGuwf0Md5KTdhU42JIJ84HYgw8FWBDIX7ThFDkjd
 qOSUzOTmBEpXDB7d1M23LgDgQVv4OGSgRdI3S7qk=
Date: Mon, 20 Dec 2021 16:38:37 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "xianwei.zhao" <xianwei.zhao@amlogic.com>
Cc: linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] dt-bindings: serial: amlogic, meson-uart: support S4
Message-ID: <YcCjfZzH4j0w0r4c@kroah.com>
References: <20211210065239.21687-1-xianwei.zhao@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211210065239.21687-1-xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_073843_141003_F34F0B38 
X-CRM114-Status: UNSURE (   7.02  )
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

On Fri, Dec 10, 2021 at 02:52:39PM +0800, xianwei.zhao wrote:
> Add serial bindings support menson S4 SoC family.
> 
> Signed-off-by: xianwei.zhao <xianwei.zhao@amlogic.com>

Please use your real name.  I doubt you sign documents with a "." in
your name :(


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
