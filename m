Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9247C54E5D
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Mar 2024 20:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Tr8kZds1jqMjgh/GRwlbbvfpJt3rywsTrn1EQEgwBk=; b=BtePEAcWCsB0IV
	ex1Ls9wkjMGp7msg3ExWOUSQ2539l97O/CJObovZwqOAG/R+2gLYO9lIF0ljCppWUVhknU2to/srE
	K+ep0eUHRpawuk8XqOqGt4kM7BJjDRKCPEsjwiYwUyNsk4ZlHUfOV0nJ5O2KFU/l9MbdiXmwHVf1V
	TqxfRlJ/jgRmy0XRaJpweZ1/gCzt03B+QAOv4oNZG4ba56Hepfze0vPY4nkMzEY5YukxwS7kyY07C
	Om3qks1GQx6KnzDtBWo0wnyonfBvLG93gAbCjCT+QdXl97ChXsE5QW3t57qQ+KZgE/zi2g6iXoB/j
	xMzGJJPkS03I9MDzSkvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rks7Z-0000000Fg1L-31iI;
	Thu, 14 Mar 2024 20:56:13 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rks7V-0000000Fg0Z-32XH;
	Thu, 14 Mar 2024 20:56:11 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1dd9066b7c3so10063475ad.2;
        Thu, 14 Mar 2024 13:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1710449766; x=1711054566; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pRHD+TcjUHkyggbW48f7epyoClmqj1C+KlHwQMyVxzE=;
        b=grhNFS42HP9lcsUK4aWvTed7ychR6d5p8y/aqlUBBvxex/txZqzMMCaL46ZU1MbT8W
         db8i/pEWOw2k6NTBIe+fWLVGmBdRKKa5l7jhDLhdBSuBHfS8YCPKbm98T1D0VT2ITlEd
         v+gjkK4r6/ITd0HkRT1Xfg8oFZZO2ywccgcyioWyDO0YDC36WsWvVEvoJ8jpvVHiHOJA
         UBgg2QsOzQzAU6fZz3DIXLygj2unprmsP+JKGW+yeYolvmUe/06lV29ZqxxKpTGMMK1d
         rkQqKR37sLr1Ho/rl7JEsqzlG3wWIsra7YjCRjO+kv++DTWoeEmMJuVFD/UtiULtnKf1
         4bfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710449766; x=1711054566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pRHD+TcjUHkyggbW48f7epyoClmqj1C+KlHwQMyVxzE=;
        b=AUr4WSbkMCerx2yEw26603hYWliLs9WkgbYb3DgW4BhhY9WnOHb9iSZqaY6fR3rxGq
         P2fwMlhxD7Foy7bzONZcoQ676mqLsaCiDYYMLNhpwugyDRfmGZ6qREqMFjpb7MS3Lys9
         zUnu/++7mBTu+OBZKQIEJKGSPg0qekbMkEKmg0SgAS4nlX6soGzooby+VXZzEHlz74BX
         qpAN0RlE5ZyD0Y91rsL0WifxdH5PlqVHjz1fKBvB1yQYOCD5h219woYxGOFHCJDo2/0X
         715KacyR+TK7Z9vwHHK1kNHahKSelkzdzKQ+fnFYbqU+NgvaGF7zgJI2uzBVOlL2ZaLw
         JnlA==
X-Forwarded-Encrypted: i=1; AJvYcCUc7yO7fBa3Y4n+uXEabstQ/O9cbVqTm7VCOHqOt8YyAVtf4BEjyfdTOTz/B4jbc+Kt0OD/DwrV9CSrfTGryyrd/UnrlWNK8bcXMXzkLyPYco/6MQ47b0eUNu2O7SCO+bmvumDGAf+9cLJeBzJ1Z6e4agOgGJc7oQ==
X-Gm-Message-State: AOJu0YxGMFxqVsHtyaXu/vvUScrnhwyjqI+DQtILIQNUItfYEWfwVqr/
	15Yplv3EVwKblwRQ03R+/e5a2EKZrWDhcygfknF5VWmAFgKyFuPIKqodjRezIm6l5fP7aK1NThi
	PRuLNzsVro2eSKqlSHvyhOL0ug/4=
X-Google-Smtp-Source: AGHT+IHX1AyajLJTVHGSXYPwtKX+7yh7PG9wayr6B9dveZH+o9n5qK2EDhZ/7woQQgmNKPpyAzCre+qGGjjW9NMe9O0=
X-Received: by 2002:a17:902:780d:b0:1dd:b6c0:1363 with SMTP id
 p13-20020a170902780d00b001ddb6c01363mr2687465pll.69.1710449766557; Thu, 14
 Mar 2024 13:56:06 -0700 (PDT)
MIME-Version: 1.0
References: <1710259663-14095-1-git-send-email-quic_mojha@quicinc.com>
In-Reply-To: <1710259663-14095-1-git-send-email-quic_mojha@quicinc.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 14 Mar 2024 21:55:55 +0100
Message-ID: <CAFBinCC4k5nuwNq8kUub2kqZGNV=qmOQribnchuFg2vaKF3J3Q@mail.gmail.com>
Subject: Re: [PATCH v2] nvmem: meson-mx-efuse: Remove nvmem_device from efuse struct
To: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, neil.armstrong@linaro.org, 
	khilman@baylibre.com, jbrunet@baylibre.com, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_135609_816707_009FA978 
X-CRM114-Status: UNSURE (   8.08  )
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

T24gVHVlLCBNYXIgMTIsIDIwMjQgYXQgNTowOOKAr1BNIE11a2VzaCBPamhhIDxxdWljX21vamhh
QHF1aWNpbmMuY29tPiB3cm90ZToKPgo+IG52bWVtX2RldmljZSBpcyB1c2VkIGF0IG9uZSBwbGFj
ZSB3aGlsZSByZWdpc3RlcmluZyBudm1lbQo+IGRldmljZSBhbmQgaXQgaXMgbm90IHJlcXVpcmVk
IHRvIGJlIHByZXNlbnQgaW4gZWZ1c2Ugc3RydWN0Cj4gZm9yIGp1c3QgdGhpcyBwdXJwb3NlLgo+
Cj4gRHJvcCBudm1lbV9kZXZpY2UgYW5kIG1hbmFnZSB3aXRoIG52bWVtIGRldmljZSBzdGFjayB2
YXJpYWJsZS4KPgo+IFNpZ25lZC1vZmYtYnk6IE11a2VzaCBPamhhIDxxdWljX21vamhhQHF1aWNp
bmMuY29tPgpSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0
aW5nbEBnb29nbGVtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
