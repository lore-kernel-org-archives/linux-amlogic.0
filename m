Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E298C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Dec 2021 08:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hzNkaMjkW/9ljglpb71IkYVNkDSjPY4nnmwnzaTSbvw=; b=czXCnWSYdgHdpV
	GeZILBwT2/wlPgrWcDVM0w3Qci68y2zsMfI+NjFtg6qVV8J/vS1DSXniGaDXpfMgObMqTcCfSSXrg
	f5hozkO5VnVchglVZsB7gbN8ZGlU/uFd4H1KsS2m0jDJ2h1kaeSmR/vNmElPHaJfiw8zard2IHJox
	fGIYLQZ8NUd9CP04sUwmT0zPnRM/aRYKrVxcbcNn9JxrDQBEKXkvevbjPejTWo9bSHUDXBMRmcSdx
	yRsS1jGgBoTvoNQL/+bvBn+UTD+M4LY/1YPz0yyZQaqsuwepnf1IakmX1OyVuww9xG1Ft6IcTK4L0
	RAQL6bz10JwEFqHNNrIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muVcv-007RM3-AZ; Tue, 07 Dec 2021 08:15:05 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muVbd-007Ql8-L5; Tue, 07 Dec 2021 08:13:46 +0000
Received: by mail-lf1-x131.google.com with SMTP id b1so31592770lfs.13;
 Tue, 07 Dec 2021 00:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=8VBBrS5Mji35H9dzLgGDSTzu48sYhkKhDmT2w5684vA=;
 b=eyXrksDMf/c8wg8yU3nEVAiX4ThD9uL4nYKBMpSP08/SJDscsXoQ3FzXsgC9+P3LEe
 A+unKaG3TKNJcWInaAHtmO01SNVmsc3kQHsY/JpdfgBzKEHUapjP71W1ba0+WyYMosG9
 MGsgDAxpp5uM74/IyF9oJGD9/y/iAS6TG+lyA4t4SqTTmy0zPVEnMrhQU6xPCTJohUU1
 ttXiyiRck6cuK0fterlCb1n9EH1daWTCRC4XLUqtBvVp82MYWo338tPocDkQ3Typ2/fo
 7/r0Wso/pdbrybIDMf5Vigw0KoiUs+8r7tmdu8nZucPx8WSLguXLFZHuAW+7YAE6VF21
 Ab4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=8VBBrS5Mji35H9dzLgGDSTzu48sYhkKhDmT2w5684vA=;
 b=0SaeLLLmqADswGWiXEEdswrxn0qqOsikdH4MohwsZmTuA7oDKTImXep4URprghmWtz
 EEX5uJlCYDgoar3udEzvnJbirloP06fDGoYWCljsDwJ/wD4NNdNjDBl27iV4g/Noaz3X
 /vsaiD5M7LZKKaGjM0sLwalMTiBEowxzrDxRAt2gM0OBZyjeH8FFEdYXDoK1z2Fkq2VT
 qRKAgbJ+GbN1MTdQjVWJlSEAhVxXLYe8/3UepMJsPR8mpb8RmZtXM7si4VKca1rnLgJ3
 zLZ07p97PdXIzTXcCpcX3UqqNebcYSF3TJKjUvNrV4Edew0tPp0MOmBxRbaGXec8Z/Rc
 GvAg==
X-Gm-Message-State: AOAM5337DUxBePgKroCe4DxKXJznA8aAHa01UGZ/CXwt9Dp3sN7EOHDQ
 sw640Mr6XXNdKmtcJKFXGa8=
X-Google-Smtp-Source: ABdhPJzvorYiMqU8lsAb1gx1vK3Pmj3BOFvmYw5exgUvQft5nH1yGsRO1olpZhwCPkIhGOaZq5LqrQ==
X-Received: by 2002:ac2:4c4e:: with SMTP id o14mr40231404lfk.148.1638864823066; 
 Tue, 07 Dec 2021 00:13:43 -0800 (PST)
Received: from smtpclient.apple (31-178-191-245.dynamic.chello.pl.
 [31.178.191.245])
 by smtp.gmail.com with ESMTPSA id p22sm1599842lfe.257.2021.12.07.00.13.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Dec 2021 00:13:42 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [RFC PATCH 3/9] arm64: dts: meson: add initial device-trees for
 X96-AIR
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20211130060523.19161-4-christianshewitt@gmail.com>
Date: Tue, 7 Dec 2021 09:13:38 +0100
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Benoit Masson <yahoo@perenite.com>
Message-Id: <FD127A47-ED36-40C6-B3A0-238166F727E7@gmail.com>
References: <20211130060523.19161-1-christianshewitt@gmail.com>
 <20211130060523.19161-4-christianshewitt@gmail.com>
To: Christian Hewitt <christianshewitt@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_001345_773621_B190A523 
X-CRM114-Status: UNSURE (   6.98  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Cgo+IFdpYWRvbW/Fm8SHIG5hcGlzYW5hIHByemV6IENocmlzdGlhbiBIZXdpdHQgPGNocmlzdGlh
bnNoZXdpdHRAZ21haWwuY29tPiB3IGRuaXUgMzAuMTEuMjAyMSwgbyBnb2R6LiAwNzowNToKPiAK
PiAKPiDigJMgMkdCIEREUjMgKyAxNkdCIGVNTUMgKyBXaUZpIGIvZy9uIChubyBCVCkgKyAxMC8x
MDAgRXRoZXJuZXQKVGVzdGVkLWJ5OiBQaW90ciBPbmlzemN6dWsgPHBpb3RyLm9uaXN6Y3p1a0Bn
bWFpbC5jb20+ICMKWDk2LUFpciB3aXRoIDEwLzEwMCBFdGgKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAps
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
