Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69098C83F09
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Jul 2025 17:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=REhZFWFGirVSGxghnMUDLw1URBHO5teDltkN6+t3mQE=; b=In22YtE+bn8WCJ
	KyHMR7oBTDr01tCrt73dRyUzmUs+dSyvfoSc46+We7OWp04ZgMr5b9xopzOIs6mRzSzqqimx8RMNT
	w+3OER8ASbZ5MsytyrMgjY39tpyuE0vBHHSha+nbAqY9pDlueaSNcSaODaiscwJ5dVQ2S56HN/UZ4
	vwbdZE5TBhULAvCy8H7XuQ2MGaTa8HSn/sqK75bPSuut6f8OGWDzYB5HKWhJgeFTmJcCwFF7srDmb
	r8CoX2SwauoSbtpFBptBh/m+w7rKKq6CrWc0LmR/MtNpXpiezmN8/kzTC3kSZZ1eX19sIUR1HFqmX
	n1DjCnL8u/xj+p9zLC8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX1ZR-00000009Abm-1hNv;
	Wed, 02 Jul 2025 17:48:33 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX1AB-000000097Mq-2jHY
	for linux-amlogic@lists.infradead.org;
	Wed, 02 Jul 2025 17:22:28 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-711a3dda147so77533177b3.2
        for <linux-amlogic@lists.infradead.org>; Wed, 02 Jul 2025 10:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1751476946; x=1752081746; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/SkwY6ne+g8BY+F31MtkqlGaiDXb8coPhVMth5244qs=;
        b=IE0XD6K45vXHIU/LA49nfwe6rvYQpiIoRyGjNlMBmwp2/V8HkJ1e+pxOmIu1ltChz6
         FREK+eTDRCg/7Bv06pJnCtpUMPdmbTcO9xYt8b50XQaHMyp0swnhlhkA134ZYi7k2ypq
         m8KYGWSYGTpV9B8yCJf8xCMMKR2MMtz7OSC0fxv7E+Bjws4IKPDJlzm3DoN+bnrdkB2Z
         pJ4SRHwMgz6IkmK9gkA0t033Cs6g9NAq75DPMrDzfKcaRna8T035JRnEOrEPgxHGRWgF
         sMw0RvrR2iBZMuBzGgYTXH0VxTKMuAJx8imoKotkfo14hoXFyFnvguOgN3XvXkbFGYug
         i+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751476946; x=1752081746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/SkwY6ne+g8BY+F31MtkqlGaiDXb8coPhVMth5244qs=;
        b=A0XhzwQIuFVqc/Ufk4sx1CqiRG3G3KR0UAU8j0ySeBwui9M0p8ReHSJYYjMEpvldPL
         amhROuwMHHQFCS6ZbOCJgsF8FOcvWuK3bkaDGFiVNAalZ/c8iNLiOeXbN1AtLiAwmjvT
         aKC9iA+gs0y8YirGJ8GZx7ud01hrmhqdFZxqVSyxOAheEUiFvH6fw+UFjvCrrlnvNw2S
         C3wufEXIG+89lK+ejy0ROlKIGeRfcdgj3FWpI1cQnMjeS+UxDUMTclzPtN7S/kg9meIK
         GKzP0JbG1gYCX8DPzzAlv/mU8q+Z59uATfdsLRYuxijsGP/OvhFwQCLxpLFQdfxiDV6H
         KFlw==
X-Forwarded-Encrypted: i=1; AJvYcCVsTMxU9goiJQt3RoPHEQTo54uz5P/MB+0mCRpaoT3bYBAhmjl4rsN5X7YxJN5VrbRp5h0Ph8usKVNy+WCM@lists.infradead.org
X-Gm-Message-State: AOJu0YzCFd1XzRc5tS4HBZNIOF3AgZDKCmOUsyQhn2YftjMVrEfowqLV
	CuJHc+UHJbrkSRwfxbmKvnc5OcTq/QYaGDhrObalJwg5lHGEWtyIQj6hi8oxT/CE9j31S6cl71n
	sEVGelONrUH7Ddc4JYbTeKcOJYRwhGTOY1h93UcSu
X-Gm-Gg: ASbGncvDkHLY6722hS19ZG7NjwvF397H/QKh9p5Nf/b8JTg5FU5V9lV4DJAtFOFI7Ac
	uiidoxK+YWixiMfqSa/+SVEiLrP0dLrOQ7p1ai26/rETj1HFFR3t7yLGloYB6wzGExx+ZtvHTT7
	kkTWjjB8WjHxS5ZyedhZILQ+/DSDFRLTZVfN6nP7nlHknmmhjT8QPX6azLJjUuCtJbrcy5xf6qg
	uOR
X-Google-Smtp-Source: AGHT+IH+2cHiDRkSexobKNpcDsdKZBCYRCcLg4PJcbDmEq49ClTbY7a3qJRhpGa/9rwzq7pB1ZCDPnILu5cCdmgnzFU=
X-Received: by 2002:a05:690c:7487:b0:712:d70b:45eb with SMTP id
 00721157ae682-7164d539984mr52498477b3.31.1751476946103; Wed, 02 Jul 2025
 10:22:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250628015328.249637-1-da@libre.computer> <CANAwSgTH67T9SBQSFQgFjvyrxNCbtfd9ZaCDZFACWA=ZQ-PYtQ@mail.gmail.com>
 <CAFBinCBwTkVwcBTWOzS+G13+rRM2eftMXZ3GHzW+F+BY0bBBzg@mail.gmail.com> <1j4ivued2q.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1j4ivued2q.fsf@starbuckisacylon.baylibre.com>
From: Da Xue <da@libre.computer>
Date: Wed, 2 Jul 2025 13:22:15 -0400
X-Gm-Features: Ac12FXzMF1aM5Sb75d0lCCLP5TcPQJxcLdk716xFOwxeZ7EpHXVjogygUeOUfJs
Message-ID: <CACqvRUa8EqMbCd2x=di-a6jbMWW8CMo4kgLH=0qnsqHdO16kxA@mail.gmail.com>
Subject: Re: [RFC] mmc: meson-gx-mmc: add delay during poweroff
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Anand Moon <linux.amoon@gmail.com>, 
	Da Xue <da@libre.computer>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_102227_841449_CBDBF5C4 
X-CRM114-Status: GOOD (  13.58  )
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

T24gV2VkLCBKdWwgMiwgMjAyNSBhdCAxOjA34oCvUE0gSmVyb21lIEJydW5ldCA8amJydW5ldEBi
YXlsaWJyZS5jb20+IHdyb3RlOgouLi4KPiBJZiwgYXMgdGhlIGRlc2NyaXB0aW9uIHN1Z2dlc3Qs
IHRoZSByZWd1bGF0b3IgZnJhbWV3b3JrIHNvbWVob3cgaWdub3JlCj4gdGhlIHRpbWluZyBzZXQg
aW4gRFQsIG1heWJlIHRoaXMgaXMgd2hhdCBuZWVkcyB0byBiZSBjaGVja2VkID8KClRoZSByZWd1
bGF0b3IgZnJhbWV3b3JrIG9ubHkgY2FyZXMgYWJvdXQgdGltaW5nIGZvciByZWd1bGF0b3Igb24u
ClJlZ3VsYXRvciBvZmYganVzdCB0dXJucyBvZmYgdGhlIHJlZ3VsYXRvciBhbmQgcmV0dXJucyB3
aXRob3V0IGRlbGF5LgpUaGUgY29kZSBtYWtlcyBpbmNvcnJlY3QgYXNzdW1wdGlvbnMuIFRoZW4g
dGhlIGtlcm5lbCByZXNldHMgdGhlIGJvYXJkCndpdGhvdXQgaGF2aW5nIGVub3VnaCB0aW1lLgpJ
IGNhbiBwYXRjaCB0aGUgcmVndWxhdG9yIGZyYW1ld29yayB3aXRoIHRoZSBzYW1lIGNvZGUgZm9y
IHJlZ3VsYXRvcgpvbiBidXQgdGhhdCBzZWVtcyB2ZXJ5IGhhemFyZG91cyBnaXZlbiBob3cgbWFu
eSB0aGluZ3MgbWlnaHQgYWxyZWFkeQpkZXBlbmQgb24gdGhlIG9yaWdpbmFsIGJlaGF2aW9yIG9m
IHJldHVybmluZyBpbW1lZGlhdGVseS4KCj4KPiBUQkggSSB3b3VsZCBzdXNwZWN0IHRoZSBkZWxh
eXMgYmVmb3JlIHRoZSByZWd1bGF0b3IgZnJhbWV3b3JrIGl0c2VsZi4KPgo+IFRob3NlIGFzc2Vy
dC9kZS1hc3NlcnQgZGVsYXlzIHRlbmQgdG8gYmUganVzdCBjb3BpZWQgZnJvbSBib2FyZHMgdG8K
PiBib2FyZHMuIE1heWJlIHNvbWUgYm9hcmRzIG5lZWQgZGlmZmVyZW50IGRlbGF5cy4gSWYgdGhv
c2UgYXJlIHRvbyBzaG9ydAo+IGZvciB0aGUgYWN0dWFsIEhXLCBhbiBPTiAtPiBPRkYgLT4gT04g
Y291bGQgcmVzdWx0IGluIGEgTk9QLgoKNTBtcyBzaG91bGQgYmUgc3VmZmljaWVudCBmb3IgYWxs
IGJvYXJkcyBhcyBtYW55IGJvYXJkcyBkb24ndCBldmVuCmhhdmUgdGhpcyBmdW5jdGlvbmFsaXR5
LiA8IDMwbXMgaXMgc3VmZmljaWVudCBtb3N0IG9mIHRoZSB0aW1lLgoKPgouLi4KPgo+IC0tCj4g
SmVyb21lCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
