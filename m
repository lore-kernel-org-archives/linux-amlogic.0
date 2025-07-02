Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49486C8303C
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Jul 2025 19:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XtP4TwGWAfEVHAvLZ/fcZImbSwihuqvELZizoxsvRaY=; b=AUlDhwlAImoiVM
	UW03gcGZnBxLFp3Bg5h2YHdKSlOVeNQ8/WGhu2Y1+cRJHvnAd6BMn1LiyZiJvWNBrCYvrclx0J0Gt
	zfrGsGR/ApUb7on3jR7X8a2W3tijxLZ0J0MnB9B8Okgi3FJXc/jLwJyjOJJO+mONHXSpTOXf+akm7
	4pwb5tXBL1tP3f1jEqtQuopAVvfweVYjvhkWlxxdhnb1UNLUNRVSdL0mR7lIEH33bnl0inxihmhfB
	iXMNfmPQe6oaefFUfbT68tmkfBd7bXHnHMDDRn3N3kC01AZqq94Ugn+nZ4QbXnvqVWgyfSbLTwYdo
	SqbDbh6IHUKW1QhHZ/BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2qJ-00000009N0h-43wP;
	Wed, 02 Jul 2025 19:10:03 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2Nj-00000009IYA-0xs1;
	Wed, 02 Jul 2025 18:40:32 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-74ad4533ac5so213433b3a.0;
        Wed, 02 Jul 2025 11:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1751481630; x=1752086430; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JD88yMHNIqJLGJNkFMm447HbjKIEZj0pTYj6EiAF6fU=;
        b=JgMEE6vOaIyyWogroVhaiBc4pGqx1CGXgbHvf+F9HilKczDiGQXXUfhp4oaQa57xr7
         C6u+5TBII25PdYxj/YLGVULcku7AarQ+UAWt3opCnFwJHEtJid78apLKHq9Z0fEM8RLi
         5wxkrUOqcvIkQtYfrhEoq+EMV69Ts+7Gk555Ve2hA2rrz3I8wOtE7dedhJJ4h6CX5T1e
         3axJifVdvgixbKxH7x/3Si357Rv4nL4fGeXIm7JAGQmzrWG2kdMVsX8/zc2y/0BaaKSe
         Wlp5gAzmxlvwlpK+xEDTqRKmhmpupwczRGrtVkL6GM2JJoq0WaK5IVqaYVJhRNp4XyeU
         5SVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751481630; x=1752086430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JD88yMHNIqJLGJNkFMm447HbjKIEZj0pTYj6EiAF6fU=;
        b=LaLvMOTDni5EmB56L2rYrqhsg0a7m+EN3DBImyPGXrsy9C4DLujNVTKSYIDOCS9PcL
         ON6meBjfM/ukqus2LDlPgYqcuVy4xtoE6TBg5D2bafLe6IlxwOpAYMn0d8JXZ1sRPfJ+
         VFRdr5BY3Sg0wR8HzYxqZEPULsjecL2LC7jXiTZjFprDVno4naoSOVZZIC3Lyl/PcLDu
         jYPPS8eomSJAYWw7eExgQeup97LCe+VIrhSVcZh09zaNzyJdcJ8rACsnkcd9M4i6MVPI
         yM4gShnI5xT80JiTSjhcZi/wQPTQAZl06vmsXpSszZLumxHGwilCYcqWfzEl8MGrfocb
         /SaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUs7rj94ZqQB4KYbnaXR/qNwiNytiEkQttvyCXp5M64TcNtL4R/+7agafuA5iIeMmcH1DWeb5WpBMpiX9/o@lists.infradead.org, AJvYcCWC5n6tIJ6VYSBhfP7V/BQTvJFGft31iVn8ZjwO7QCV71OnuykbigujyUNgNH72j7ec3/vMXub6nrt1njrgs4pQeg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAXv0mYCpmlGrBi9feBWwa9FSom0HZfbMTCFtaprFYELMMB75v
	dJLzhWOAbjwI7O9ISZ+YooqQEaNDEDLhVkntfTJLL5FZILSStTFYjd7BliQsP6AFTx+6e3zJ1TI
	EkBQFRg3LFGM4z6kWQKzQac7A9Y7hpfg=
X-Gm-Gg: ASbGncs08hXWGK0YeYLQrJv2D1ISu9itz+56wmKPCs3TxYcnqRlvV4UU8so6/qgSwOS
	Mb96Se8eMoK/RTKJotEs9AESw3VTFaYkRUssKLWKEm/PjuOOeazvubt/AbJ5djmmvcND61rf6bX
	yFP4veDMtkdX+wejjpq60nUV5yAUEKxN/Aedv16/umxbvDbcpxjmJEWlCm/oXKZHhFNJ1cA5ESj
	7oY8eGyM97KkT8=
X-Google-Smtp-Source: AGHT+IG65z5JM5OzIy1s20zy0osr0gbaem7rZyJo8s4662EGg8M9d+IcT5RnhEheXmCheH3vHusHJ+Ckhe0dlVQMHpE=
X-Received: by 2002:a17:902:fc4c:b0:215:b1e3:c051 with SMTP id
 d9443c01a7336-23c793c0efcmr7045825ad.11.1751481630377; Wed, 02 Jul 2025
 11:40:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250628015328.249637-1-da@libre.computer> <CANAwSgTH67T9SBQSFQgFjvyrxNCbtfd9ZaCDZFACWA=ZQ-PYtQ@mail.gmail.com>
 <CAFBinCBwTkVwcBTWOzS+G13+rRM2eftMXZ3GHzW+F+BY0bBBzg@mail.gmail.com>
 <1j4ivued2q.fsf@starbuckisacylon.baylibre.com> <CACqvRUa8EqMbCd2x=di-a6jbMWW8CMo4kgLH=0qnsqHdO16kxA@mail.gmail.com>
In-Reply-To: <CACqvRUa8EqMbCd2x=di-a6jbMWW8CMo4kgLH=0qnsqHdO16kxA@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 2 Jul 2025 20:40:19 +0200
X-Gm-Features: Ac12FXyR3mTzwKK3QsWJnUHD7XVn0YOVkSs2GNj-PlIQxt00gwgIj8Cr0AYFXDE
Message-ID: <CAFBinCAkW+G9oV+SOJdac50oLezQnbc358dBgs56-RfjPd-zgA@mail.gmail.com>
Subject: Re: [RFC] mmc: meson-gx-mmc: add delay during poweroff
To: Da Xue <da@libre.computer>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Anand Moon <linux.amoon@gmail.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_114031_267793_6F1DCC69 
X-CRM114-Status: GOOD (  13.06  )
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

T24gV2VkLCBKdWwgMiwgMjAyNSBhdCA3OjIy4oCvUE0gRGEgWHVlIDxkYUBsaWJyZS5jb21wdXRl
cj4gd3JvdGU6Cj4KPiBPbiBXZWQsIEp1bCAyLCAyMDI1IGF0IDE6MDfigK9QTSBKZXJvbWUgQnJ1
bmV0IDxqYnJ1bmV0QGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4gLi4uCj4gPiBJZiwgYXMgdGhlIGRl
c2NyaXB0aW9uIHN1Z2dlc3QsIHRoZSByZWd1bGF0b3IgZnJhbWV3b3JrIHNvbWVob3cgaWdub3Jl
Cj4gPiB0aGUgdGltaW5nIHNldCBpbiBEVCwgbWF5YmUgdGhpcyBpcyB3aGF0IG5lZWRzIHRvIGJl
IGNoZWNrZWQgPwo+Cj4gVGhlIHJlZ3VsYXRvciBmcmFtZXdvcmsgb25seSBjYXJlcyBhYm91dCB0
aW1pbmcgZm9yIHJlZ3VsYXRvciBvbi4KPiBSZWd1bGF0b3Igb2ZmIGp1c3QgdHVybnMgb2ZmIHRo
ZSByZWd1bGF0b3IgYW5kIHJldHVybnMgd2l0aG91dCBkZWxheS4KVGhlcmUncyBhbiBleGNlcHRp
b24gdG8gdGhpczogZ3Bpby1yZWd1bGF0b3JzIHdpdGhvdXQgYW4gZW5hYmxlLWdwaW9zCnByb3Bl
cnR5LiBNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgcmVndWxhdG9yX2Rpc2FibGUoKSBpcyBhIG5v
LW9wIGluCnRoYXQgY2FzZSAobWVzb25fbW1jX3NldF9pb3MoKSBldmVuIGhhcyBhIGNvbW1lbnQg
YWJvdmUgdGhlCnN3aXRjaC9jYXNlIHN0YXRlbWVudCksIHNlZSBbMF0uCgo+IFRoZSBjb2RlIG1h
a2VzIGluY29ycmVjdCBhc3N1bXB0aW9ucy4gVGhlbiB0aGUga2VybmVsIHJlc2V0cyB0aGUgYm9h
cmQKPiB3aXRob3V0IGhhdmluZyBlbm91Z2ggdGltZS4KQ2FuIHlvdSBwbGVhc2UgbmFtZSB0aGUg
Ym9hcmQgeW91J3JlIHRlc3Rpbmc/IEknbSB3b3JyaWVkIHRoYXQgSSdsbCBiZQpsb29raW5nIGF0
IG9uZSAuZHRzIGJ1dCB5b3UncmUgbG9va2luZyBhdCBhbm90aGVyIG9uZS4KCgpCZXN0IHJlZ2Fy
ZHMsCk1hcnRpbgoKClswXSBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4xNS9z
b3VyY2UvZHJpdmVycy9yZWd1bGF0b3IvY29yZS5jI0wyOTgwCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAps
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
