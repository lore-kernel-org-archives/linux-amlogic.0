Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980D7C35FFA
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Mar 2025 22:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=90qiNyYLM+zvDGu7ReNRHA6DkMSjDjP65lBmcUOz76E=; b=qaCJbIzGFBMocH
	Ik+L8o/0xNq5T73m0iVeJcZKYTX/rtDLdnyP0BXPXvlvX5+pWXLMpGbZEwb4IwZqHx3lrzkW6AzKS
	QaQF06P5SZhRDWj/w1IvWD6mZZFUfDyqstqMwnlEBAnZBDAMrPx+ObDMdIjFdHloXLj2e+Z3KSXzH
	Tv40CGK2gFrkRan78HQA3K9yMG4XhAolloG6r0+Xq6KBmVryoNs1EcDd84mOH01vJ/6N58uMLXbNY
	Wwoqj6sT4cHCvVTI3bjJ9KZYLHoLdfZsp6hkT/W5WSw6sgci3NRIWvkf5WJ/PZSoUK+Gb7Oc8jsFs
	XBM7pSW7UAM+82qwWpTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv2B7-0000000AJpg-3qm0;
	Wed, 19 Mar 2025 22:46:25 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv2B5-0000000AJpD-1V1f;
	Wed, 19 Mar 2025 22:46:24 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-22398e09e39so1327065ad.3;
        Wed, 19 Mar 2025 15:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1742424382; x=1743029182; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRQIvZ3jaUBwceFPvK/o3Jqmpa0wMuq6j3XaA0hEZLI=;
        b=Stoer+3uSpT/NvgliH6NYh192sQpjslQmvTqKnwnZL7gGAe3rJAAHuQJY7KfKZSOwv
         n2W1OSQ2Wm8LHixGb3HOSd4aIKLCVMyHK3NhC/JRwLD6qKUD4ThZh1/o+w7klTmvhMs/
         9/9zcjfK0YaYJ6gJhsAeGRwW3ah55xg5sJV3KMlYIyDlcpf1xcq8GSgtkH/MqAtCenSg
         TnAxgSeCns8sN2fn/QMaYSe+jcf0m6ScxK+HwG+M0wt5OCjdQVIRm+/l9Csans6oKdkL
         hNXfx9Mys9GrbQqsKI5DYn98e4HVGiyJ+syIwhMNUIBo9X40aRowmAF+Uc78iA5LOQBq
         Kocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742424382; x=1743029182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bRQIvZ3jaUBwceFPvK/o3Jqmpa0wMuq6j3XaA0hEZLI=;
        b=gCRVEFAlkRhzu4SBbtYkeuIDllvjy5AaHDkWf0ZPfczOPWXwG7IL7uQVF45M09wRH4
         jI5HI2pOFZJ46RMJNa3HbBUY5WtY8UTDakYo83XeJoCKEhYCoJ2V+cSmLIU0NfQO4Kgz
         afUWhBIeFkeEd6sTGCGBE0nNJXM+L8rXFw8XIfgjbRnj5ZKMHed0n0wXzn6gYjLG//XB
         nIePQEsYeI/JC7ktzxDqLs6h5Tn3MZQuphaUcpq5IhU4gyeZ50ENb5QO+UwdVIC5AYx+
         L2X9DLUeJBraziMzGoqZdBrrUW9HnLcritLAkT35Mssz8sqIaxK3gZ4ABmxnLyJVF4Kq
         yiWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJ4sX9PeJEnYQMhZhsuRG3tXYVwXxXmenwixOf6BwA3UilbCo4+f/9OUBw5KOUrAoMSU+GvZ59eEMts7cEGq1dog==@lists.infradead.org, AJvYcCVLxiyfOYSWJ5A08x6XATAYh+1ZkH27SO/wxNSUm9PYbj0SVzXHZghmZYxJYX8VW5PtX++yc+9FrmmhscxY@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9QuXg0krMlb2iTz9SNMMYjkDjDS7UQ12T/+UEtTHkBzv8MSvF
	yJLEZKq4C+ArcYE/nBrryVb/VOwDLASrb8JPt9tnEFMECxtD0LYt4MabN612MfHTEXGOz18zqbc
	s2oDzTQZK2350Z4RrjkGKJFT2rrw=
X-Gm-Gg: ASbGncuBUpdXbGRiEzI//FqI9W6lIN9qFqqOmCzypXsmyF5QdOv94zupnsGVTsXc9U0
	k3KCSp0gYktiCNUWoXm8hgmyHTc98+4M87zSc11tQqOPL0iYuAqvKdvNHPqKlBW8hjzWZ5oj9AD
	i3pxQwlWrqFV2INGgXkH8UucjVVfUm9aHsgcwSx1p3WDikIqiEUlksOK6WnEs=
X-Google-Smtp-Source: AGHT+IG8GiaDjf3sdv7Ye3FkTV+AEaDW7f6KYxRvPyZsM3yaqLJDqBbKlA9xkI4sNwT7OOGxYzetDJTJZ5N5BHjlaJM=
X-Received: by 2002:a17:903:32ce:b0:224:2a6d:55ae with SMTP id
 d9443c01a7336-2265ee924fbmr16165715ad.48.1742424382296; Wed, 19 Mar 2025
 15:46:22 -0700 (PDT)
MIME-Version: 1.0
References: <41ced8db-caeb-4deb-9193-9802fc603180@linaro.org> <47683e40-aa0e-4d86-9226-94f7d56f34ae@app.fastmail.com>
In-Reply-To: <47683e40-aa0e-4d86-9226-94f7d56f34ae@app.fastmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 19 Mar 2025 23:46:11 +0100
X-Gm-Features: AQ5f1JpBHXJRBsjDf382ohz1oHEzy_ztXE_MKlrqlUkHAd_fr7KlcjqRE5tCQhw
Message-ID: <CAFBinCCY4-sETrXoi5ELjXhnUYB+6q+A3M2FqaGCFprBxe31kA@mail.gmail.com>
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v6.15
To: Arnd Bergmann <arnd@arndb.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, soc@kernel.org, arm <arm@kernel.org>, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_154623_399768_D05779C4 
X-CRM114-Status: GOOD (  17.74  )
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

SGkgQXJuZCwKCk9uIFdlZCwgTWFyIDE5LCAyMDI1IGF0IDk6NTjigK9QTSBBcm5kIEJlcmdtYW5u
IDxhcm5kQGFybmRiLmRlPiB3cm90ZToKPgo+IE9uIE1vbiwgTWFyIDE3LCAyMDI1LCBhdCAxNzox
MywgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gPiBIaSwKPiA+Cj4gPiBIZXJlJ3MgYSBjaGFuZ2Vz
ZXQgZm9yIEFtbG9naWMgQVJNNjQgRFQsIGFsc28gc3dpdGNoaW5nIHRvIHRoZSBuZXcgUFdNIGJp
bmRpbmdzLAo+ID4gYWRkaW5nIHBpbmN0cmwgc3VwcG9ydCBmb3IgQW1sb2dpYyBBNCBTb0Mgd2l0
aCBhIGJyYW5kIG5ldyBiaW5kaW5nIHN0eWxlIHRoZW4KPiA+IGZpbmFsbHkgZ3Bpb19pbnRjIG5v
ZGUgZm9yIEFtbG9naWMgQTQgJiBBNSBTb0NzLgo+Cj4gSSdsbCBza2lwIHRoaXMgb25lIGZvciA2
LjE1LCBzZWVpbmcgdGhhdCB0aGUgYnJhbmNoIGNvbnRhaW5zIGJvdGgKPiBkcml2ZXIgYW5kIGRl
dmljZXRyZWUgY2hhbmdlcywgd2hpY2ggbWVzc2VzIHVwIHRoZSB3YXkgSSBzZW5kCj4gdGhlIGNv
bnRlbnRzLgpUaGVyZSdzIGFuIGltbXV0YWJsZSBicmFuY2ggaW4gdGhlIGxpbnV4LXBpbmN0cmwg
dHJlZSBmcm9tIExpbnVzLgpJJ20gbm90IHN1cmUgb24gdGhlIGV4YWN0IHByb2Nlc3MgaGVyZSAo
d2hldGhlciB0aGUgY29udGVudHMgb2YgdGhlCnRhZyBhcmUgZmluZSBhbmQgd2UncmUgImp1c3Qi
IG1pc3NpbmcgYSBkZXNjcmlwdGlvbiwgLi4uKSBzbyBJJ2xsIGxldApOZWlsIGNvbW1lbnQgb24g
dGhpcy4KCj4gRnJvbSB0aGUgZGVzY3JpcHRpb24gSSBhbHNvIGNhbid0IHRlbGwgdG8gd2hhdCBk
ZWdyZWUgdGhlcmUgaXMKPiBiYWNrd2FyZHMgY29tcGF0aWJpbGl0eSBpbiB0aGUgbmV3IGJpbmRp
bmcsIEkgYXNzdW1lIHRoZSBjaGFuZ2VkCj4gUFdNIGFuZCBwaW5jdHJsIGRyaXZlcnMgY29udGlu
dWUgdG8gd29yayBmaW5kIHdpdGggdGhlIG9sZCBkdHMKPiBidXQgbm90IHRoZSBvdGhlciB3YXkg
cm91bmQsIHdoaWNoIGlzIHdoeSB5b3Ugc2VudCB0aGVtIHRvZ2V0aGVyPwpUaGUgUFdNIHBhcnQg
aXMgYmFja3dhcmRzIGNvbXBhdGlibGUuIFRoZSBiaW5kaW5ncyBhcmUgdXBzdHJlYW0gc2luY2UK
Y29tbWl0IDVmZDYxY2MyODE3MSAoImR0LWJpbmRpbmdzOiBwd206IGFtbG9naWM6IEFkZCBhIG5l
dyBiaW5kaW5nIGZvcgptZXNvbjggcHdtIHR5cGVzIikuClRoZSBtZW50aW9uZWQgcGluY3RybCBi
aW5kaW5nIC8gZHJpdmVyIGlzIGNvbXBsZXRlbHkgbmV3IGZvciB0aGUgQTQKU29Dcywgc28gdGhl
cmUncyBub3RoaW5nIHRvIGJlIGJhY2t3YXJkcyBjb21wYXRpYmxlIHdpdGguCgpOZWlsLCBmb3Ig
bWUgaXQncyBmaW5lIHRvIHNraXAgdGhpcyBvbmUgZm9yIDYuMTUgaWYgaXQgY2F1c2VzIHRvbyBt
dWNoCndvcmsgb24geW91ciBzaWRlLgpVc2luZyB0aGUgb2xkIFBXTSBiaW5kaW5ncyBmb3IgYW5v
dGhlciByZWxlYXNlIHdvbid0IGh1cnQgYW55b25lLgpBbmQgSSB0aGluayB0aGUgc2FtZSBnb2Vz
IGZvciBBNCBwaW5jdHJsIHN1cHBvcnQgYXMgd2VsbCBhcyBHUElPCmludGVycnVwdCBjb250cm9s
bGVyIG5vZGVzIGZvciBBNC9TNS4KCgpCZXN0IHJlZ2FyZHMsCk1hcnRpbgoKClswXSBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1ncGlvL0NBQ1Jwa2RaZy05WnIzZjd6RzM2eDdqR3ZUNDZG
UmZSSjQwa2hOWkRkWWIwMS1CR2lnd0BtYWlsLmdtYWlsLmNvbS8KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
