Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86493CD5BB0
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 May 2026 17:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aSUEK19UyiTW/JzBrt8YOTmZj2vAlb9onFccc61fn8U=; b=G9CFGYDjoBdT+k
	N0OK01m6lnX7zQtnSNnWTuN6aeuYtGChQtN5SCI/ZxMgI0iWeUThvs5WoakmhbxJYGDvhVhRcn41o
	8g/Zh+7iWh2ogmubA4Ez6nammWfTBQ2SEk9JNyRnUS6L2Mic0viIIJIbPssL2FzM96SbomMhnxv8H
	YAgEEOGuzeQn94wV3QcRWMk+y5LiDWDGj19gjdsuSIjvokYNJSdL4Vh33QA6rdv68dGizwaA9oCuj
	zgwQOuRqXHWbv0JnjQtXGwUE38gLvDT9jA3Io+vnAOFs1CoNm2YkzL8le1uow5q501h/SEfM3qBUD
	BZXQKSSxqyyAdVpF+L9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ7QX-00000008g3Y-3ne6;
	Thu, 21 May 2026 17:43:21 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ7QU-00000008g2f-2vVZ
	for linux-amlogic@lists.infradead.org;
	Thu, 21 May 2026 17:43:20 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-67c1e0229acso10742568a12.1
        for <linux-amlogic@lists.infradead.org>; Thu, 21 May 2026 10:43:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779385396; cv=none;
        d=google.com; s=arc-20240605;
        b=WKuy8SgwOt3fYn0cV1XjsDrJJDc/OfGG3JycTz6dc/Zerc0eCiE0C+nYnfDcOX15w6
         1FAhbABMKd5O5KG1pSAqOYBsZirrhUawBQYgejJaCVMi7NGouUJ038IkzXmuRWN1tdN7
         c93lHxwXlzjjewB0RXPvjKL7vZk783gF8s+/QCrtMp5XkEdCFLvZzc9fXnFBrnNI0Xfa
         A38KUeeshcxkVqgIyPViQownS83dSl6HdZZ5DhGn+rzCNQ0sfXLokwqXCxyc8I6E2HsG
         p+XA/fYqfX/5cSZx04x7aWjEx0MTqGo4UBoSL4O/H9hje1QqeoLDpJRYuPR4MEXT8KJK
         Qyow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e3rDSUe7KLZOmgAp60b5SR5E4yTJDtktblrOBb74mtU=;
        fh=OCg+46JRtRwgNbD7K95h8pS03/8QzuNLsbCMookNwrA=;
        b=CJ+9gQY82JzXDkMDnFerQv3I6K+orRiexonkbbAxgA8xTfWW6wWVUDW0gwDvDQELau
         IuNQC73euINEzQLIznoF318z9YtUbVOuLI8lcsDf/tmPMzHZZD6Qj7QA5ifPCR8+Fgne
         idRAngcoGnp5wm2LERRBXCJcegN998Y7ExdVQIdPdjgQkIqN3HmxHgJVYstsP7QNFlTs
         EpcL6wuKI6I4es4lmJHLCicXUVbzkfWojBlepEezIG5UNWmLPTTWiSyO4ouRTgCUtgA8
         wykvlUadXj9v6ALuykJPFCaVPoFedkALW7LQLv5kAT5zvJEgXD7yhBAaLRWqNeu4/5v7
         XExA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779385396; x=1779990196; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3rDSUe7KLZOmgAp60b5SR5E4yTJDtktblrOBb74mtU=;
        b=KYGElWo+a3QNYN2W/mhLr+fuwZXXMoQnP9VaCLgDaCY2Oii4WlxyJwTTPZb5HDTT3+
         RauZE+wLoIMTAY53WmnFiztxcr441yla9JUfjEu75WwwZ/fldHW1gggnWhm+Oy5FvAF+
         5l1bH95DAmdMg36Wv+uOdJoqpN1YdtU3kK0BnGlDveTN52gbFU0IEnlzudNBLgs2U9DB
         sXBWUxLsJgy+O4Cgp/YXNrnTblxqLQfqfJ9FCQ0HEbKclgTCqlvoywM7xRvuWP7cynex
         m0L3qWuWfRYiQ7vsYf+x+vH+D4mH2vpl0X1H55QL0/IngzFJB4HgogaSwSsgR+flihEY
         yjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779385396; x=1779990196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e3rDSUe7KLZOmgAp60b5SR5E4yTJDtktblrOBb74mtU=;
        b=jrB3P67N7Aa/XGewwOLTKHLozP4+1r9Yhfl4xGqGPDjxnlAAkX+S/68B9yC+Bhawgg
         f1R0ne4w+g90BRqHR1aWGW0/95qSk5GFeZRNh1lLOaTOG1oua3QyYdOExnJSwp7q6Y2Q
         DwE0MssdXTWqNx9JCoglu1iQCP1T9N0sLa2K7Tkp7SArhWkjcMnuvTY0etfIHAGrQztC
         gHnDNo9sfFJww8AiOZpzi9stkPsR3W9WekmVgpD3GwJBmbT08/coCKDWPt0KsZxdys36
         yhCW7b0eqzw6+atDPzA+svklzsVjDXtz9AwWXWX987XaLia+CPfA98JwvesquFdf2Mkb
         nx5g==
X-Forwarded-Encrypted: i=1; AFNElJ90TiEg6XOnuqzoQ1WUg31WM4H9vcF3BSwQYSrnop8ByVrstfNJ5+Cx6yFrexi8moTvg6mdYcm6/mwLNEZj@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb9K0ImZezkjMFJXMueZ+Kg6XEpGxIVG8fckzWC3A2/6bQM+8j
	F3yK70KXQBgKXqO+mRFs9XnH+8M1fx90M/Uc2r9l27lRlGBiUi/t4qkW/3KLMjXhtDuwIy/Jk77
	GpVQXSX6Z+tj7nfXL95Yl4qrJh8Vjo6M=
X-Gm-Gg: Acq92OGDOSO1k1Q5YYOTKHs8PCKHpn6ZoJlJt6lyI0/uOGuHltIc4guuIO8wTU59KxI
	jBAm5rNhWdtbDRhwL/vbMjxW3D5CA+RvejQgF0LaebvPFKDp3mifR1m6WqSDaKDxqE8lmYvVuac
	N5Cum3QHiiSrFCckwAXVes616vFGvqTvB634rTD23iXeGiTT7W2+wtfhlio4Om6ttbqqZQorhJz
	kNKmpKfEbyrB+Mw52xNAbnJrSDHDHfPsZxUxm/t5MQ3siCbblLKzkSu92FVrTa++egX6hcRDoKG
	Bab/dg==
X-Received: by 2002:a05:6402:2792:b0:677:1ce0:c08d with SMTP id
 4fb4d7f45d1cf-68836bca5afmr2159034a12.18.1779385396210; Thu, 21 May 2026
 10:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260521073449.10057-2-linux.amoon@gmail.com> <20260521080928.26A3E1F000E9@smtp.kernel.org>
In-Reply-To: <20260521080928.26A3E1F000E9@smtp.kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 21 May 2026 23:12:59 +0530
X-Gm-Features: AVHnY4LceKynZbX-6PIn7iaMcEhtfr9doxs8GOVQDJzeHmTmfj9sZJSWkEDiNEs
Message-ID: <CANAwSgQxxpDfwKQo0DNjYbTQhY-hHGL-BAndU3dTOTUxsg2PGA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] media: meson: vdec: Fix memory leak in error path
 of vdec_open
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_104319_290620_695171CA 
X-CRM114-Status: GOOD (  19.25  )
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

SGkgU2FzaGlrbywKClRoYW5rcyBmb3IgeW91ciAgcmV2aWV3IGNvbW1lbnQsCk9uIFRodSwgMjEg
TWF5IDIwMjYgYXQgMTM6MzksIDxzYXNoaWtvLWJvdEBrZXJuZWwub3JnPiB3cm90ZToKPgo+IFRo
YW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDEg
cG90ZW50aWFsIGlzc3VlKHMpIHRvIGNvbnNpZGVyOgo+IC0gW0hpZ2hdIEluY29ycmVjdCB0ZWFy
ZG93biBvcmRlciBpbiBgdmRlY19jbG9zZSgpYCBjYXVzZXMgdXNlLWFmdGVyLWRlc3Ryb3kgb2Yg
dGhlIFY0TDIgY29udHJvbCBoYW5kbGVyJ3MgbXV0ZXguCj4gLS0KPgo+IGNvbW1pdCA4MmU5MTY3
NzFhNzc5YjAyNTAwZjk3ZDU4ZTM0NGJiOTNjYThlOWNhCj4gQXV0aG9yOiBBbmFuZCBNb29uIDxs
aW51eC5hbW9vbkBnbWFpbC5jb20+Cj4KPiBtZWRpYTogbWVzb246IHZkZWM6IEZpeCBtZW1vcnkg
bGVhayBpbiBlcnJvciBwYXRoIG9mIHZkZWNfb3Blbgo+Cj4gVGhpcyBjb21taXQgaW50cm9kdWNl
cyBhIHByb3BlciBlcnJfbTJtX2N0eF9yZWxlYXNlIGxhYmVsIGluIHRoZSBlcnJvciBwYXRoCj4g
b2YgdmRlY19vcGVuKCkgdG8gZW5zdXJlIHRoZSBtMm0gY29udGV4dCBpcyByZWxlYXNlZCBiZWZv
cmUgcmVsZWFzaW5nIHRoZSBtMm0KPiBkZXZpY2UuIEl0IGFsc28gYXR0ZW1wdHMgdG8gZnJlZSB0
aGUgVjRMMiBjb250cm9sIGhhbmRsZXIgbWVtb3J5IGluCj4gdmRlY19jbG9zZSgpIHRvIGZpeCBh
IHJlc291cmNlIGxlYWsuCj4KPiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
MDI2MDUyMDA0NTkwNS42QUNCQTFGMDAwRTlAc210cC5rZXJuZWwub3JnLyN0Cj4KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvbWVzb24vdmRlYy92ZGVjLmMgYi9kcml2ZXJz
L3N0YWdpbmcvbWVkaWEvbWVzb24vdmRlYy92ZGVjLmMKPiA+IC0tLSBhL2RyaXZlcnMvc3RhZ2lu
Zy9tZWRpYS9tZXNvbi92ZGVjL3ZkZWMuYwo+ID4gKysrIGIvZHJpdmVycy9zdGFnaW5nL21lZGlh
L21lc29uL3ZkZWMvdmRlYy5jCj4KPiBbIC4uLiBdCj4KPiA+IEBAIC05MjYsNiArOTI4LDcgQEAg
c3RhdGljIGludCB2ZGVjX2Nsb3NlKHN0cnVjdCBmaWxlICpmaWxlKQo+ID4KPiA+ICAgICAgIHY0
bDJfbTJtX2N0eF9yZWxlYXNlKHNlc3MtPm0ybV9jdHgpOwo+ID4gICAgICAgdjRsMl9tMm1fcmVs
ZWFzZShzZXNzLT5tMm1fZGV2KTsKPiA+ICsgICAgIHY0bDJfY3RybF9oYW5kbGVyX2ZyZWUoJnNl
c3MtPmN0cmxfaGFuZGxlcik7Cj4KPiBbU2V2ZXJpdHk6IEhpZ2hdCj4gQ291bGQgdGhpcyBzcGVj
aWZpYyBvcmRlcmluZyBjYXVzZSBhIHVzZS1hZnRlci1kZXN0cm95IG9mIHRoZSBWNEwyIGNvbnRy
b2wKPiBoYW5kbGVyJ3MgbXV0ZXg/Cj4KPiBJZiBhbiBhcHBsaWNhdGlvbiBoYXMgc3Vic2NyaWJl
ZCB0byBhIFY0TDIgY29udHJvbCBldmVudCwgdjRsMl9maF9leGl0KCkKPiB1bmNvbmRpdGlvbmFs
bHkgY2FsbHMgdjRsMl9ldmVudF91bnN1YnNjcmliZV9hbGwoKS4gVGhpcyB1bnN1YnNjcmliZSBs
b2dpYwo+IGV2ZW50dWFsbHkgaW52b2tlcyB2NGwyX2N0cmxfZGVsX2V2ZW50KCksIHdoaWNoIGF0
dGVtcHRzIHRvIGxvY2sgdGhlCj4gY29udHJvbCBoYW5kbGVyJ3MgbXV0ZXguCj4KPiBTaW5jZSB2
NGwyX2N0cmxfaGFuZGxlcl9mcmVlKCkgZGVzdHJveXMgdGhlIG11dGV4Ogo+Cj4gdjRsMl9jdHJs
X2hhbmRsZXJfZnJlZSgpCj4gICAgIG11dGV4X2Rlc3Ryb3koJmhkbC0+X2xvY2spOwo+Cj4gQ2Fs
bGluZyBpdCBiZWZvcmUgdjRsMl9maF9leGl0KCkgY291bGQgbGVhZCB0byBvcGVyYXRpbmcgb24g
YSBkZXN0cm95ZWQgbXV0ZXgKPiBhbmQgcG90ZW50aWFsbHkgY2F1c2UgYSBrZXJuZWwgcGFuaWMg
aWYgbXV0ZXggZGVidWdnaW5nIGlzIGVuYWJsZWQuCj4KPiBTaG91bGQgdjRsMl9jdHJsX2hhbmRs
ZXJfZnJlZSgpIGJlIGNhbGxlZCBhZnRlciB2NGwyX2ZoX2RlbCgpIGFuZAo+IHY0bDJfZmhfZXhp
dCgpIGluc3RlYWQ/Cj4KPiA+ICAgICAgIHY0bDJfZmhfZGVsKCZzZXNzLT5maCwgZmlsZSk7Cj4g
PiAgICAgICB2NGwyX2ZoX2V4aXQoJnNlc3MtPmZoKTsKPiA+Ckkgd2lsbCB0cnkgdG8gc3R1ZHkg
YW5kIHVwZGF0ZSBpbiB0aGUgbmV4dCB2ZXJzaW9uLgo+Cj4gLS0KPiBTYXNoaWtvIEFJIHJldmll
dyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA1MjEwNzM0NDkuMTAwNTct
MS1saW51eC5hbW9vbkBnbWFpbC5jb20/cGFydD0xCgpUaGFua3MKLUFuYW5kCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
