Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B536C5AC67
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Aug 2026 04:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hKQ1BDuWsBcw6JAnWRIlh6/LEXQ+/XBQJEVJp7cq51c=; b=JMAZMVzqbZvEO5
	54hCZzeMspVDDi+SF6wJmDNrVP1avZKJMM+1Q/1i73fQKKwtspRM1Ai5oI8meZntLMWgvN4ns79wf
	RTIwfQqFNLEYJfKB2HIJh1535nKOcpMn/URpqOCaQDUhe01RPzenwb+VzD3ZAd04QM0EpMCSne5Hs
	7LH2n9szeA/ImJksDrMdj1wSY0VLlCQLkDmLIUAPALd4OkIuIc2zI6wJlc8lVjS8ZaDASWUd2E+95
	jeggMyQf1RSAgH+EqUeugFMbD2giMsdA6rgLKebeZA79lxoqQhxhQ9iX6/bcSmXSCLX0fN5MWzfDg
	3gx2klTrD+Px4I8rfNTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuNDs-0000000HNEr-2mes;
	Thu, 13 Aug 2026 04:39:20 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuNDp-0000000HNEV-3kHL
	for linux-amlogic@lists.infradead.org;
	Thu, 13 Aug 2026 04:39:19 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so1948009b3a.3
        for <linux-amlogic@lists.infradead.org>; Wed, 12 Aug 2026 21:39:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786595957; cv=none;
        d=google.com; s=arc-20260327;
        b=V3fl9PSm3vAned8jORvz/NURqYLPhUNgqTav3FkltfrxuOyIgp9epGr9qL/KhcgctR
         lJDgSBH3To+K7Or7yRaLoSaaTVzGCLZUoXwi1IKksOhlv5InJyAFik4g8cdqZnDk07Tz
         C+hGU6jS2c9Mh3M68+0/AQ1PVZ3bRhHkrkadd/Ruwhh/rHazpVdlO7GB2snU1xqRV77o
         8Le36H9S0oIuWttVwpysx6oMxx+YwqCubZaBMhZ3c5TZQ9PKOx3UXVaL63gJRI2jLofD
         t/abmKjXQ/24D8Q2KCfTJKSRd2+NkWRpoltgpbj8tz692iXLGmQY/babUpCUbNTdXllG
         XqKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XYpEx9HkEnMrxTTj9VAReLXkOthyicSAduUByBP+u38=;
        fh=wGmLmLUBzAzP3CfdNhiVXAxByuAgGVU8yQcKWNJ4T4Q=;
        b=btZK9upzHOWCNMup4/nSENOiyNQNOjnjp3yfW6Z4kWbDluM3r7y+g5uK2Qt1SN5arR
         tB4z88QnkRs9sWhRfUerjRKIFDXpZ4VHm7yFH07YfPwfHCfMlDaDD6unyfq6TYuqJKun
         UHoIopEvj23uIMq9nfFVPASG5VLDC96CkF4crjXVUInhFggxdEiInTq3VEaOLLiGGvPp
         9nTnm6jrLENJkUHeDd4iJlvY+k6ilhL2qfb7PeTZs2DkZHCW9CauorUO7lsZw43Hdamd
         qlhJBzaArqXu16qOGpEjEZ1OojxUqnDCu5yp5+lNaPIXBeDJXuDgkp2RsR2E6nCK45kv
         OxMA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786595957; x=1787200757; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XYpEx9HkEnMrxTTj9VAReLXkOthyicSAduUByBP+u38=;
        b=d1Ta2yjhBq/oF5W7ID7eGkqUXRoMQ9YBIdK9mWo/70YaL+2NBUtqnGvGpohVhobP9g
         Acam1DGQ0lL3bWlA5gnWiNW9hkq1YYRdbQillbsk4aWRTF0teeNnyIXb1wucwmpCRmDn
         Ehf+4SxBLG4rmCdS02WjTgmBP6J1vR4HxQxD/JaU1dyLVCa7m+7yx9p2CQTc0FxSAqkP
         OkCXFZ9yxKHQF816vdLRxa9yRTl85c+PvE0nI/ka00zyx7AW/v2TTQ8xOPF7l5Ahfkxp
         aVU4+fVvIVjyFwv1RqJzV8+NoS/1bHKkvi4XKxLf+Z+Zd8uQsJq4YfvnWPQmEYcf3WTh
         yKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786595957; x=1787200757;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XYpEx9HkEnMrxTTj9VAReLXkOthyicSAduUByBP+u38=;
        b=LYnl5LID8wmXDHQGIWoddLD0yf6xcR+eL+gnl2JF10B71OtTgh7AbNdnJlsT5PR19f
         VytT4eCP8P7iwQxdC9Jbcunry6sAjYIDhC8mL98LPj/5PwQwazEpxLT9f9VHfMsJlEiu
         m9cdiq6IyZWWY83aRI/hb/lNA53AD0B1SOPg6HXGojfudV9bxPPk1jXKZX77roe5kNSy
         6VuYJCaOjNj1lqJak4sQ6tvpg4tgpYHMRY43frs+skFQeUowe/wIqEf9xLsbzQGTTWdE
         Lvd+hwv34yOvacCsZxfPJFtthTtZn52YE1+h6msuPGdqgf/h2RSwLfhVgiK397tiyyEv
         4Spg==
X-Forwarded-Encrypted: i=1; AHgh+RpJO+HeaWsB+LN6uMtfYdSsprTqhkUXWbWqvBPltLuJZ2tjKTMWwTYdBTA7by8X+9La+t0wxLEmxFCsLtXi@lists.infradead.org
X-Gm-Message-State: AOJu0YxtpbyrCvW+1ScwR5cGf/Jh5Y5PD08lyGqIbOv4vKDJvf00c+Sg
	vLlYBw9lrUb9mQXlSC9Vbn1ZiEdySalaa7bcRrIhwZLLuTIxmNEdebM2n+2SeVMdGdypx/PWCek
	IfVNUux9JAzlYSZya39+FqZkImTZHe8TCnqMF
X-Gm-Gg: AR+sD13WpofeEwCa7Kh/ScdEvRE0YtuulbVogJuLdYWcrEQIIvGADqVNIvwqTUdR0mp
	NLprdURpI+wYydK/YOVmejdxheu5PO3EzIHIUBN4vW1uXkkQkkdXwCUsXOHAUcwYv53W5VYzq9O
	JqREM7gU1fzrAuxKJ21F1SmBr38701Qfm+5nfv+EUq6++YOMuqKO5mAjm5hR2pvHBs5u7lqZ82x
	msK+19oYksjOx7ddYc2GdsEkuJWSXJ9l3rXrbo8nC08Yqc68qlVjxub7CuTWA1HFCduHKrQoFss
	HloNx9d5xzaOVmzg5V+I3/ss+4hVjqJUTXKoIS+ioUXctyAAZ5SRLEaWtFu0tOl2bqcekLCiki1
	bC7lS3EY9+dAGuo5+iUXYhtk2dYfSHo9PwIH0+ePyOFo+rx5LkidV7tPg
X-Received: by 2002:a05:6a00:2e09:b0:847:9ce5:d293 with SMTP id
 d2e1a72fcca58-84fc75d7052mr3029392b3a.24.1786595956685; Wed, 12 Aug 2026
 21:39:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260812112023.42254-1-phucduc.bui@gmail.com> <20260812112023.42254-2-phucduc.bui@gmail.com>
 <20260812114044.4D4481F000E9@smtp.kernel.org>
In-Reply-To: <20260812114044.4D4481F000E9@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 13 Aug 2026 11:39:04 +0700
X-Gm-Features: AUfX_mxIGA074y1m10Z4uUGjKnNbeOvwgaN0R96bR9Dhl-K9zsWpmGzk0Vj6-cA
Message-ID: <CAABR9nE1r3-2eafWqfTv8kJg7G_urfC0hP36NgqeGt9QPf6NrA@mail.gmail.com>
Subject: Re: [PATCH 1/3] mmc: meson-gx: Handle errors from optional IRQ lookup
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_213917_935907_6264BFA4 
X-CRM114-Status: GOOD (  10.67  )
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

Pgo+IFtTZXZlcml0eTogSGlnaF0KPiBEb2VzIHRoaXMgY29kZSBwYXNzIGFuIHVuaW5pdGlhbGl6
ZWQgdmFyaWFibGUgdG8gbW1jX2dwaW9fc2V0X2NkX2lycSgpCj4gd2hlbiB0aGUgb3B0aW9uYWwg
SVJRIGlzIG5vdCBwcmVzZW50Pwo+Cj4gSWYgcGxhdGZvcm1fZ2V0X2lycV9vcHRpb25hbCgpIHJl
dHVybnMgLUVOWElPLCB0aGUgYXNzaWdubWVudCB0byBjZF9pcnEKPiBpcyBza2lwcGVkLiBUaGUg
dW5pbml0aWFsaXplZCBjZF9pcnEgdmFyaWFibGUgaXMgdGhlbiBwYXNzZWQgdG8KPiBtbWNfZ3Bp
b19zZXRfY2RfaXJxKCkuCj4KPiBJZiB0aGUgdW5pbml0aWFsaXplZCBzdGFjayB2YWx1ZSBoYXBw
ZW5zIHRvIGJlID49IDAsIG1tY19ncGlvX3NldF9jZF9pcnEoKQo+IHdpbGwgYWNjZXB0IGl0IGFu
ZCBvdmVyd3JpdGUgdGhlIGNhcmQtZGV0ZWN0IElSUSBjb25maWd1cmF0aW9uIHdpdGggYW4KPiBp
bnZhbGlkIG9yIHJhbmRvbSBJUlEgbnVtYmVyLgo+Cj4gQ291bGQgY2RfaXJxIGJlIGluaXRpYWxp
emVkIHRvIGEgbmVnYXRpdmUgdmFsdWUgd2hlbiBpdCBpcyBkZWNsYXJlZD8KPgoKCk9rYXksIHlv
dSBhcmUgcmlnaHQuIEhvd2V2ZXIsIG1tY19ncGlvX3NldF9jZF9pcnEoKSBhbHJlYWR5IGNoZWNr
cyBmb3IKdGhpcyBjYXNlOgotLS0tLS0tLS0tLS0tLS0tLS0tLQppZiAoIWN0eCB8fCBpcnEgPCAw
KQogICAgICAgIHJldHVybjsKLS0tLS0tLS0tLS0tLS0tLS0tLS0KCknigJlsbCBmaXggdGhpcyBi
eSBpbml0aWFsaXppbmcgY2RfaXJxIHRvIC1FTlhJTzoKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQppbnQgY2RfaXJxID0gLUVOWElPOwotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
