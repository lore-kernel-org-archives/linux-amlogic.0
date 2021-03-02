Return-Path: <SRS0=PVzI=IB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9D2FC433E0
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Mar 2021 19:50:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA20F64EBA
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Mar 2021 19:50:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA20F64EBA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ebguBkudwarcg338F1Kn552Dx5FpizifDJDmwAuC5GA=; b=O02V8v9Mm112sQTBI3gngHZzb
	8nxQ6JrIwCzK7qkb2nDVIjNWqeDsZRbsnh9uL9ihVKg/05/x7J6JsbEqSdzkgrM6eebCItDfAsoEc
	pGbMA6oToVzoNZOA7Q+V6WtxbVMcCfdXK4dr4pzH0Q9QQwVcNXJXJN7bh75diV/OneV6CupzlzYjk
	zJY19s6FJWodFNzG6TfFcqvEwW5Aw3o0QXQPJpobG/RnDNy6Tx8F8LX/RzKRl3FrXFTamDuaOevBb
	bVO/wcmmz1iisQ6ogPT9uh2sVU0y1iTl34NqVIoawMq0gQDFX4YpKFmTYDnt2ZZHAc7DAHeU0+5eu
	GZMhE83DA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHXW0-006INQ-70; Wed, 03 Mar 2021 19:50:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT4P-005IMp-Fn
 for linux-amlogic@desiato.infradead.org; Wed, 03 Mar 2021 15:05:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=ipzKgXeizt6BmN+OGsb44knynSvjjGK3CzazIKs9374=; b=RKonitIz6Md5CSpXe7hThl3VvX
 prXSnym3h/7HoFgF96G7KE165kzInwyN+cSP/XFL9VNs0r/zragyHismAlgP+VID2CqpDdRJ7sXQV
 g9PBCqoLU4OD7Rl99k5SW3X98myZ1xGYFWp7ijqkcWKeRjXd/fE3xuIB03uUSs+U09PkTmv6H8LuK
 yNufc3cXf/yxQlWwnlhbv8yDGq4w7AW09+784D8BzPsaU4updGwL0cwZimLmpKHdDJ/EZbq6CNhm7
 A2jw2bYXTZMS9atcaVJcJdMWvJZnbeA8sIY4Kni1q9olnemiBKetz/md82+tu1phHOCul42gwQvRM
 NRVkrLLg==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHESc-000cmz-Ba
 for linux-amlogic@lists.infradead.org; Tue, 02 Mar 2021 23:29:51 +0000
Received: by mail-pj1-x102d.google.com with SMTP id d2so3098798pjs.4
 for <linux-amlogic@lists.infradead.org>; Tue, 02 Mar 2021 15:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ipzKgXeizt6BmN+OGsb44knynSvjjGK3CzazIKs9374=;
 b=zTamd4+L69irImZO916OGGfq4jArrhMgYX9K5mq290L8iRf1StKtUDB5oogfeORVXn
 oagt5Jzb0TMZWqGuvbQV/D49n0X2MRR5ky/bNhywHYq90Sc+A3jjOqWrLtqGXo6fMvZ5
 vXdNmUT94VAOs++442lf7JEI3DBSBnWApiV+icgTgX1+CIES5guufH3ox99CTo9+Q36M
 rMgD7D9hNr20Kc+4JH+0HhZOLsUmiqKZX3TRx9i6rl6poHSQ4hFiW+4sVyhxeGiESEm7
 QQHoqh79usBJFWppqgrXj9wn7aHfSEPF/GE0/ztMAVt4pSb9DE9E8dNTQ7g+mvZxxOXU
 lejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=ipzKgXeizt6BmN+OGsb44knynSvjjGK3CzazIKs9374=;
 b=qQ1mRaUoPoFIEpTltZmzaB9n8PiIgnn7tZnAght9SDWvW9jbdkahhJ3sLHO3Dv8PcM
 w34Lsa5qPAITSn7XAdsoBKKDxlizUEB/MTpR+xclUl+jjIEllfzeNQIip99xgc70LLbN
 vrWQX0Jua0MN40+MYdtcw5Q+norgI2e/jUJNNh7mRGmmL1Gkr0rmVCRp6+aqpRGzhLxU
 Eqdbsml4SU0W4YzaE5QOuzJ6LYYMtclpMudES6xSYDfsAShBsLGo6Yp2tClH+mSpMb9A
 0Ons6fN51ypDCjg13T56HvCwg21cikm3gyjiakhg5WsLlPwgxMxtgRtmLcTwfPz1p7fs
 hA4g==
X-Gm-Message-State: AOAM533fiNiqxdTblG005TVJkX/sjJ6mx1lSQ5FaZ2dhYqsJ+ZupwWi9
 CO4VLTykX4xr+CkVSNomhrd8RA==
X-Google-Smtp-Source: ABdhPJz4brOTtDCNQIzehAXWj1n5G/JaChhgAM6wmN3cU++9a0+DfYrF5rYFzhrvV3wEj6fdCuVCig==
X-Received: by 2002:a17:90a:ce0c:: with SMTP id
 f12mr6741028pju.11.1614727724307; 
 Tue, 02 Mar 2021 15:28:44 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id j201sm23586612pfd.143.2021.03.02.15.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 15:28:43 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Corentin Labbe <clabbe@baylibre.com>, =?utf-8?B?SsOpcsO0bWU=?= Brunet
 <jbrunet@baylibre.com>
Subject: Re: [PATCH] Revert "arm64: dts: amlogic: add missing ethernet reset
 ID"
In-Reply-To: <20210126080951.2383740-1-narmstrong@baylibre.com>
References: <20210126080951.2383740-1-narmstrong@baylibre.com>
Date: Tue, 02 Mar 2021 15:28:43 -0800
Message-ID: <7hczwh9luc.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_232951_539219_BBEE1FEB 
X-CRM114-Status: GOOD (  10.53  )
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

SGkgTmVpbCwKCk5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4gd3JpdGVz
OgoKPiBJdCBoYXMgYmVlbiByZXBvcnRlZCBvbiBJUkMgYW5kIGluIEtlcm5lbENJIGJvb3QgdGVz
dHMsIHRoaXMgY2hhbmdlIGJyZWFrcwo+IGludGVybmFsIFBIWSBzdXBwb3J0IG9uIHRoZSBBbWxv
Z2ljIEcxMkEvU00xIEJhc2VkIGJvYXJkcy4KPgo+IFdlIHN1c3BlY3QgdGhlIGFkZGVkIHNpZ25h
bCB0byByZXNldCBtb3JlIHRoYW4gdGhlIEV0aGVybmV0IE1BQyBidXQgYWxzbwo+IHRoZSBNRElP
LyhSRylNSUkgbXV4IHVzZWQgdG8gcmVkaXJlY3QgdGhlIE1BQyBzaWduYWxzIHRvIHRoZSBpbnRl
cm5hbCBQSFkuCj4KPiBUaGlzIHJldmVydHMgY29tbWl0IGYzMzYyZjBjMTgxNzRhMWYzMzRhNDE5
YWI3ZDU2N2EzNmJkMWIzZjMgd2hpbGUgd2UgZmluZAo+IGFuZCBhY2NlcHRhYmxlIHNvbHV0aW9u
IHRvIGNsZWFubHkgcmVzZXQgdGhlIEV0aGVybmV0IE1BQy4KPgo+IFJlcG9ydGVkLWJ5OiBDb3Jl
bnRpbiBMYWJiZSA8Y2xhYmJlQGJheWxpYnJlLmNvbT4KPiBBY2tlZC1ieTogSsOpcsO0bWUgQnJ1
bmV0IDxqYnJ1bmV0QGJheWxpYnJlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9u
ZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4gLS0tCj4gSGkgS2V2aW4sCj4KPiBUaGlzIGhh
cyBiZWVuIHJlcG9ydGVkIHRvIGFsc28gYnJlYWsgb24gNS4xMCwgd2hlbiB0aGlzIGxhbmRzIG9u
IDUuMTEsIEknbGwgc2VuZCBhbm90aGVyCj4gcGF0Y2ggZm9yIDUuMTAgYmVjYXVzZSBtZXNvbi1h
eGcuZHRzaSBuZWVkcyBhIGNvbmZsaWN0IHJlc29sdXRpb24gb24gNS4xMS4KCkxvb2tzIGxpa2Ug
dGhpcyBuZXZlciBnb3Qgc3VibWl0dGVkIHRvIHY1LjEwLiAgSSBqdXN0IGRpc2NvdmVyZWQgaXQg
dGhhdAp2NS4xMCBpbiBTRUk2MTAgKGludGVybmFsIFBIWSkgaXMgYnJva2VuLgoKQ291bGQgeW91
IHN1Ym1pdCB0aGlzIHRvIHY1LjEwIHN0YWJsZSBhbHNvIHBsZWFzZT8KClRoYW5rcywKCktldmlu
CgoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMK
